#-*- coding: utf-8 -*-
class CreateOralcePackage < ActiveRecord::Migration
  def up
    execute %{
    create or replace package HDM_COMMON_DATA_IMPORT is
    /* $Header: hdmcdis.pls 2.3 2013/04/25 17:00:03 steven ship $ */

    /*

       Copyright (c) 2013 by Hand Corporation

       NAME
         hdm_common_data_import - PL/SQL Package for data import
       DESCRIPTION
         This package performs data import functions in HDM
       NOTES
         This package must be used under hdm.
       HISTORY                            (YYYY/MM/DD) Description
         steven.gu                        2013/04/01  Creation
    */


    procedure import_data(batchId           in varchar2,
                          templateId        in varchar2,
                          combinationRecord in varchar2,
                          overwrite         in boolean,
                          flag              out boolean);


    end HDM_COMMON_DATA_IMPORT;
}

    execute %{
    create or replace package HDM_DATA_VALIDATION is
    /* $Header: hdmcdis.pls 2.3 2013/07/30 17:00:03 steven ship $ */

    /*

       Copyright (c) 2013 by Hand Corporation

       NAME
         HDM_DATA_VALIDATION - PL/SQL Package for data import
       DESCRIPTION
         This package performs validation functions in HDM
       NOTES
         This package must be used under hdm.
       HISTORY                            (YYYY/MM/DD) Description
         steven.gu                        2013/08/01  Creation

    */


   /*procedure validate_product_category(batchId           in varchar2,
                                      templateId        in varchar2,
                                      combinationRecord in varchar2,
                                      indexNo           in number,
  								                       mmode             in varchar2,
                                      args              in varchar2,
                                      flag              out boolean);
	procedure validate_product_id(batchId           in varchar2,
                                templateId        in varchar2,
                                combinationRecord in varchar2,
                                indexNo           in number,
								                  mmode             in varchar2,
                                args              in varchar2,
                                flag              out boolean);*/

    end HDM_DATA_VALIDATION;
}
    execute %{
	create or replace package body HDM_DATA_VALIDATION is

  function get_template_table(p_template_id varchar2) return varchar2 is
    cursor cur_1 is
      select t.temporary_table
        from dip_template t
       where t.id = p_template_id;
    l_template_table VARCHAR2(30 CHAR);
  
  begin
    for lr_1 in cur_1 loop
      l_template_table := lr_1.temporary_table;
    end loop;
  
    return(l_template_table);
  end get_template_table;

  procedure get_template_table(p_template_id    in varchar2,
                               x_template_table out varchar2,
                               x_table_name     out varchar2) is
    cursor cur_1 is
      select t.temporary_table, t.table_name
        from dip_template t
       where t.id = p_template_id;
  begin
    for lr_1 in cur_1 loop
      x_template_table := lr_1.temporary_table;
      x_table_name     := lr_1.table_name;
      exit;
    end loop;
  
  end get_template_table;

  /*procedure validate_product_category(batchId           in varchar2,
                                        templateId        in varchar2,
                                        combinationRecord in varchar2,
                                        indexNo           in number,
                                        mmode             in varchar2,
                                        args              in varchar2,
                                        flag              out boolean) is
  
    l_temp_table varchar2(32);
  
    l_update_tmp_sql varchar2(2000);
  
    l_error_sql_en  varchar2(2000);
    l_error_sql_zhs varchar2(2000);
  begin
    flag := true;
  
    l_temp_table := get_template_table(templateId);
  
    l_update_tmp_sql := 'update ' || l_temp_table || ' t set t.cols' ||
                        (indexNo + 1000) ||
                        ' = (select t1.id from b2bdw_product_cate_dc t1 where t1.product_category_desc = t.cols' ||
                        indexNo || ' and t1.is_manual_input = ''N'') ' ||
                        ' where t.batch_id = ''' || batchId || '''';
  
    execute immediate l_update_tmp_sql;
  
    l_error_sql_en := 'insert into dip_error (batch_id,sheet_no,sheet_name,row_number,message,created_at,updated_at,locale)' ||
                      ' select batch_id,sheet_no,sheet_name,row_number,' ||
                      '''Column ' || indexNo || ' is not valid''' ||
                      ',sysdate,sysdate,' || '''EN''' || ' from ' ||
                      l_temp_table || ' t where t.batch_id = ''' || batchId || '''' ||
                      ' and t.cols' || indexNo || ' is not null ' ||
                      ' and t.cols' || (indexNo + 1000) || ' is null';
  
    l_error_sql_zhs := 'insert into dip_error (batch_id,sheet_no,sheet_name,row_number,message,created_at,updated_at,locale)' ||
                       ' select batch_id,sheet_no,sheet_name,row_number,' ||
                       '''第 ' || indexNo || ' 列,取值非法''' ||
                       ',sysdate,sysdate,' || '''ZH''' || ' from ' ||
                       l_temp_table || ' t where t.batch_id = ''' ||
                       batchId || '''' || ' and t.cols' || indexNo ||
                       ' is not null ' || ' and t.cols' || (indexNo + 1000) ||
                       ' is null';
  
    execute immediate l_error_sql_en;
    if sql%found then
      flag := false;
    end if;
  
    execute immediate l_error_sql_zhs;
  
  end validate_product_category;
  procedure validate_product_id(batchId           in varchar2,
                                templateId        in varchar2,
                                combinationRecord in varchar2,
                                indexNo           in number,
								                   mmode             in varchar2,
                                args              in varchar2,
                                flag              out boolean) is
  
    l_temp_table varchar2(32);
  
    l_update_tmp_sql varchar2(2000);
  
    l_error_sql_en  varchar2(2000);
    l_error_sql_zhs varchar2(2000);
  begin
    flag := true;
  
    l_temp_table := get_template_table(templateId);
  
    l_error_sql_en := 'insert into dip_error (batch_id,sheet_no,sheet_name,row_number,message,created_at,updated_at,locale)' ||
                      ' select batch_id,sheet_no,sheet_name,row_number,' ||
                      '''Column ' || indexNo || ' is not valid''' ||
                      ',sysdate,sysdate,' || '''EN''' || ' from ' ||
                      l_temp_table || ' t where t.batch_id = ''' || batchId || '''' ||
                      ' and t.cols' || indexNo || ' is not null ' ||
                      ' and not exists (select v.value from b2bdw_fin_resource_v v where v.type = ''PRODUCT_ID''
                        and t.cols' || indexNo ||
                      ' = v.value)';
  
    l_error_sql_zhs := 'insert into dip_error (batch_id,sheet_no,sheet_name,row_number,message,created_at,updated_at,locale)' ||
                       ' select batch_id,sheet_no,sheet_name,row_number,' ||
                       '''第 ' || indexNo || ' 列,取值非法''' ||
                       ',sysdate,sysdate,' || '''ZH''' || ' from ' ||
                       l_temp_table || ' t where t.batch_id = ''' ||
                       batchId || '''' || ' and t.cols' || indexNo ||
                       ' is not null ' ||
                       'and not exists (select v.value from b2bdw_fin_resource_v v where v.type = ''PRODUCT_ID''
                        and t.cols' || indexNo ||
                       ' = v.value)';
    execute immediate l_error_sql_en;
    if sql%found then
      flag := false;
    end if;
  
    execute immediate l_error_sql_zhs;
  
  end validate_product_id;*/
  end HDM_DATA_VALIDATION;
	}
    execute %{
    create or replace package HDM_COMMON_DATA_VALIDATION is
    /* $Header: hdmcdvb.pls 2.3 2013/04/25 17:00:03 steven ship $ */

    /*

       Copyright (c) 2013 by Hand Corporation

       NAME
         hdm_common_data_import - PL/SQL Package for data validation
       DESCRIPTION
         This package performs data validation functions in HDM
       NOTES
         This package must be used under hdm.
       HISTORY                            (YYYY/MM/DD) Description
         steven.gu                        2013/04/01  Creation

    */

    procedure validate_null(batchId           in varchar2,
                          templateId        in varchar2,
                          combinationRecord in varchar2,
                          indexNo           in number,
                          mmode             in varchar2,
                          args              in varchar2,
                          flag              out boolean);

  procedure validate_number(batchId           in varchar2,
                            templateId        in varchar2,
                            combinationRecord in varchar2,
                            indexNo           in number,
                            mmode             in varchar2,
                            args              in varchar2,
                            flag              out boolean);

  procedure validate_date(batchId           in varchar2,
                          templateId        in varchar2,
                          combinationRecord in varchar2,
                          indexNo           in number,
                          mmode             in varchar2,
                          args              in varchar2,
                          flag              out boolean);

  procedure validate_unique(batchId           in varchar2,
                            templateId        in varchar2,
                            combinationRecord in varchar2,
                            indexNo           in number,
                            mmode             in varchar2,
                            args              in varchar2,
                            flag              out boolean);
  --updated at 2013/05/07 11:03 add validate_y_n
  procedure validate_y_n(batchId           in varchar2,
                         templateId        in varchar2,
                         combinationRecord in varchar2,
                         indexNo           in number,
                         mmode             in varchar2,
                         args              in varchar2,
                         flag              out boolean);
  procedure validate_1_0(batchId           in varchar2,
                         templateId        in varchar2,
                         combinationRecord in varchar2,
                         indexNo           in number,
                         mmode             in varchar2,
                         args              in varchar2,
                         flag              out boolean);
  /*
  validate_blank_character: 验证该列不包含空格
  */
  procedure validate_blank_character(batchId           in varchar2,
                                     templateId        in varchar2,
                                     combinationRecord in varchar2,
                                     indexNo           in number,
                                     mmode             in varchar2,
                                     args              in varchar2,
                                     flag              out boolean);
  procedure validate_not_zero(batchId           in varchar2,
                              templateId        in varchar2,
                              combinationRecord in varchar2,
                              indexNo           in number,
                              mmode             in varchar2,
                              args              in varchar2,
                              flag              out boolean);

  /*验证该列是否是大小写字母数字和下划线的组合*/
  procedure validate_valid_string(batchId           in varchar2,
                                  templateId        in varchar2,
                                  combinationRecord in varchar2,
                                  indexNo           in number,
                                  mmode             in varchar2,
                                  args              in varchar2,
                                  flag              out boolean);

  /*validate_value_set0: 判断该列数据是否在对应值集（通过args传入对应的键编码）的描述中
  存code导描述，页面显示描述*/
  procedure validate_value_set0(batchId           in varchar2,
                                templateId        in varchar2,
                                combinationRecord in varchar2,
                                indexNo           in number,
                                mmode             in varchar2,
                                args              in varchar2,
                                flag              out boolean);
  /*validate_value_set1: 判断该列数据是否在对应值集（通过args传入对应的键编码,这种值集的code和描述是相同的）
  的code中,存code导code，页面显示code*/
  procedure validate_value_set1(batchId           in varchar2,
                                templateId        in varchar2,
                                combinationRecord in varchar2,
                                indexNo           in number,
                                mmode             in varchar2,
                                args              in varchar2,
                                flag              out boolean);
	/*
  validate_col_length: 验证该列长度不超过XX字符数
  参考args: 80
  80表示该列长度不超过80个字符
  */
  procedure validate_col_length(batchId           in varchar2,
                                templateId        in varchar2,
                                combinationRecord in varchar2,
                                indexNo           in number,
                                mmode             in varchar2,
                                args              in varchar2,
                                flag              out boolean);
  /*
  validate_col_valid: 验证某列取值是否在其他表的某列上
  参数args样例：HP_DIM_ATTRIBUTE,ATTRIBUTE
  warning: 当多张模板的真实表对应都是目标表时，需修改procedure
  */
  procedure validate_col_valid(batchId           in varchar2,
                               templateId        in varchar2,
                               combinationRecord in varchar2,
                               indexNo           in number,
                               mmode             in varchar2,
                               args              in varchar2,
                               flag              out boolean);						
    end HDM_COMMON_DATA_VALIDATION;
}
    execute %{
    create or replace package HDM_DATA_VALUE is
    type cur_type is ref cursor;
    /*procedure get_value(combinationRecord in varchar2,
                        dataInput         in varchar2,
                        cur               out cur_type);*/

    end HDM_DATA_VALUE;}

    execute %{
  create or replace package body HDM_COMMON_DATA_IMPORT is
  /* $Header: hdmcdib.pls 2.3 2013/04/25 17:00:03 steven ship $ */

  /*
  
     Copyright (c) 2013 by Hand Corporation
  
     NAME
       hdm_common_data_import - PL/SQL Package for data import
     DESCRIPTION
       This package performs data import functions in HDM
     NOTES
       This package must be used under hdm.
     HISTORY                            (YYYY/MM/DD) Description
       steven.gu                        2013/04/01  Creation
       M-ejam                           2013/08/29  Update
  
  */

  procedure import_data(batchId           in varchar2,
                        templateId        in varchar2,
                        combinationRecord in varchar2,
                        overwrite         in boolean,
                        flag              out boolean) is
    cursor cur_temp_table is
      select upper(t.temporary_table) temporary_table,
             upper(t.table_name) table_name,
             upper(t.query_view) query_view,
             t.combination_id,
             t.import_program
        from DIP_TEMPLATE t
       where t.id = templateId;
  
    cursor cur_table_column is
      select t.column_name, t.data_type, t.mapped, t.omitted, t.is_pk
        from dip_template_column t
       where t.template_id = templateId
       order by t.index_id;
  
    l_template_table dip_template.temporary_table%type;
    l_table_name     dip_template.table_name%type;
  
    l_cols_count number := 0;
    l_cols       varchar2(20);
    l_cols_sql   varchar2(200);
   
  
    l_sql_insert      varchar2(4000);
    l_sql_insert_data varchar2(2000);
    l_sql_update      varchar2(4000);
    l_sql_update_data varchar2(2000);
  
    l_sql_update_pk      varchar2(2000);
    l_sql_update_pk_data varchar2(2000);
  begin
    flag := true;
    

  
    for lr_temp_table in cur_temp_table loop
      l_template_table := lr_temp_table.temporary_table;
      l_table_name     := lr_temp_table.table_name;
    end loop;
  
    l_sql_insert      := 'insert into ' || l_table_name ||'(id,batch_id,created_by,updated_by,created_at,updated_at,combination_record';
    l_sql_insert_data := 'select ' || l_table_name ||'_S.NEXTVAL,batch_id,created_by,updated_by,created_at,updated_at,combination_record';
    l_sql_update      := 'update ' || l_table_name ||' a set (batch_id,updated_by,updated_at,combination_record';
    l_sql_update_data := '(select batch_id,updated_by,updated_at,combination_record';
    l_sql_update_pk   := 'update ' || l_template_table ||' t set t.target_id = (select a.rowid from ' ||l_table_name || ' a where 1 = 1 ';
    l_sql_update_pk_data := null;
  
    for lr_table_column in cur_table_column loop
      l_cols_count := l_cols_count + 1;
    
      if lr_table_column.omitted = 0 then
        if lr_table_column.mapped = 1 then
          l_cols := 't.cols' || (l_cols_count + 1000);
        else
          l_cols := 't.cols' || l_cols_count;
        end if;
      
        if lr_table_column.data_type = 'NUMBER' then
          l_cols_sql := 'to_number(' || l_cols || ')';
        elsif lr_table_column.data_type = 'DATE' then
          l_cols_sql := 'to_date(' || l_cols ||
                        ',''YYYY-MM-DD-HH24:MI:SS'')';
        else
          l_cols_sql := l_cols;
        end if;
      
        l_sql_insert      := l_sql_insert || ',' ||lr_table_column.column_name;
        l_sql_insert_data := l_sql_insert_data || ',' || l_cols_sql;
        l_sql_update      := l_sql_update || ',' ||lr_table_column.column_name;
        l_sql_update_data := l_sql_update_data || ',' || l_cols_sql;
      
        if lr_table_column.is_pk = 1 then
          l_sql_update_pk_data := l_sql_update_pk_data || ' and a.' ||lr_table_column.column_name || ' = ' ||l_cols_sql;
        end if;
      
      end if;
    end loop;
  
    if overwrite = true then
      if combinationRecord is not null then
        execute immediate 'delete from ' || l_table_name ||' where combination_record = ''' ||combinationRecord || '''';
      else
        execute immediate 'truncate table ' || l_table_name;
      end if;
    
    else
    
      if l_sql_update_pk_data is not null then
        if combinationRecord is null then
          l_sql_update_pk := l_sql_update_pk || l_sql_update_pk_data ||
                             ') where t.batch_id = ''' || batchId ||
                             ''' and exists(select 1 from ' || l_table_name ||
                             ' a where 1 = 1 ' || l_sql_update_pk_data || ')';
        else
          l_sql_update_pk := l_sql_update_pk || l_sql_update_pk_data ||
                             ' and a.combination_record = t.combination_record ) where t.batch_id = ''' ||
                             batchId || ''' and exists(select 1 from ' ||
                             l_table_name || ' a where 1 = 1 ' ||
                             l_sql_update_pk_data ||
                             ' and a.combination_record = t.combination_record)';
        end if;
      
        execute immediate l_sql_update_pk;
      end if;
    
    end if;
  
    l_sql_insert := l_sql_insert || ') ' || l_sql_insert_data || ' from ' ||
                    l_template_table || ' t where batch_id = ''' || batchId ||
                    ''' and target_id is null';
  
    l_sql_update := l_sql_update || ') = ' || l_sql_update_data || ' from ' ||
                    l_template_table || ' t where t.batch_id = ''' ||
                    batchId || ''' and t.target_id = a.rowid)' ||
                    ' where a.rowid in (select t1.target_id from ' ||
                    l_template_table || ' t1 where t1.batch_id = ''' ||
                    batchId || ''' and t1.target_id is not null)';
  
    execute immediate l_sql_insert;
  
    if overwrite = true then
      null;
    else
      execute immediate l_sql_update;
    end if;
  
  exception
    when others then
      flag := false;
    
      hdm_common_log.log(p_batch_id => batchId,
                         p_message  => dbms_utility.format_error_stack || '. ' ||
                                       dbms_utility.format_error_backtrace,
                         p_locale   => 'ZH');
    
      hdm_common_log.log(p_batch_id => batchId,
                         p_message  => dbms_utility.format_error_stack || '. ' ||
                                       dbms_utility.format_error_backtrace,
                         p_locale   => 'EN');
  end import_data;
end HDM_COMMON_DATA_IMPORT;
}

    execute %{
    create or replace package body HDM_COMMON_DATA_VALIDATION is
    /* $Header: hdmcdvb.pls 2.3 2013/04/25 17:00:03 steven ship $ */

    /*

       Copyright (c) 2013 by Hand Corporation

       NAME
         hdm_common_data_import - PL/SQL Package for data validation
       DESCRIPTION
         This package performs data validation functions in HDM
       NOTES
         This package must be used under hdm.
       HISTORY                            (YYYY/MM/DD) Description
         steven.gu                        2013/04/01  Creation

    */

     function get_template_table(p_template_id varchar2) return varchar2 is
    cursor cur_1 is
      select t.temporary_table
        from dip_template t
       where t.id = p_template_id;
    l_template_table VARCHAR2(30 CHAR);
  
  begin
    for lr_1 in cur_1 loop
      l_template_table := lr_1.temporary_table;
    end loop;
  
    return(l_template_table);
  end get_template_table;

  procedure get_template_table(p_template_id    in varchar2,
                               x_template_table out varchar2,
                               x_table_name     out varchar2) is
    cursor cur_1 is
      select t.temporary_table, t.table_name
        from dip_template t
       where t.id = p_template_id;
  begin
    for lr_1 in cur_1 loop
      x_template_table := lr_1.temporary_table;
      x_table_name     := lr_1.table_name;
      exit;
    end loop;
  
  end get_template_table;

  procedure validate_null(batchId           in varchar2,
                          templateId        in varchar2,
                          combinationRecord in varchar2,
                          indexNo           in number,
                          mmode             in varchar2,
                          args              in varchar2,
                          flag              out boolean) is
    l_temp_table varchar2(30);
    l_table_name varchar2(30);
  
    l_error_sql_en  varchar2(2000);
    l_error_sql_zhs varchar2(2000);
  begin
    flag := true;
  
    get_template_table(templateId, l_temp_table, l_table_name);
  
    l_error_sql_en := 'insert into dip_error (batch_id,sheet_no,sheet_name,row_number,message,created_at,updated_at,locale)' ||
                      ' select batch_id,sheet_no,sheet_name,row_number,' ||
                      '''Column ' || indexNo || ' can not be null''' ||
                      ',sysdate,sysdate,' || '''EN''' || ' from ' ||
                      l_temp_table || ' t where t.batch_id = ''' || batchId || '''' ||
                      ' and t.cols' || indexNo || ' is null ';
  
    l_error_sql_zhs := 'insert into dip_error (batch_id,sheet_no,sheet_name,row_number,message,created_at,updated_at,locale)' ||
                       ' select batch_id,sheet_no,sheet_name,row_number,' ||
                       '''第' || indexNo || ' 列值不能为空''' ||
                       ',sysdate,sysdate,' || '''ZH''' || ' from ' ||
                       l_temp_table || ' t where t.batch_id = ''' ||
                       batchId || '''' || ' and t.cols' || indexNo ||
                       ' is null ';
  
    execute immediate l_error_sql_en;
    if sql%found then
      flag := false;
      execute immediate l_error_sql_zhs;
    end if;
  end validate_null;

  procedure validate_number(batchId           in varchar2,
                            templateId        in varchar2,
                            combinationRecord in varchar2,
                            indexNo           in number,
                            mmode             in varchar2,
                            args              in varchar2,
                            flag              out boolean) is
  
    l_temp_table varchar2(32);
    l_table_name varchar2(30);
  
    l_error_sql_en  varchar2(2000);
    l_error_sql_zhs varchar2(2000);
    l_sql_validate  varchar2(2000);
  
    l_count number;
  begin
    flag := true;
  
    get_template_table(templateId, l_temp_table, l_table_name);
  
    l_sql_validate := 'select count(to_number(t.cols' || indexNo ||
                      ')) from ' || l_temp_table ||
                      ' t where batch_id = ''' || batchId || '''';
  
    begin
      execute immediate l_sql_validate
        into l_count;
    exception
      when others then
        flag := false;
      
        l_error_sql_en := 'insert into dip_error (batch_id,sheet_no,sheet_name,row_number,message,created_at,updated_at,locale)' ||
                          ' select batch_id,sheet_no,sheet_name,0,' ||
                          '''Column ' || indexNo || ' should be number''' ||
                          ',sysdate,sysdate,' || '''EN''' || ' from ' ||
                          l_temp_table || ' t where t.batch_id = ''' ||
                          batchId || '''' || ' and rownum = 1';
      
        l_error_sql_zhs := 'insert into dip_error (batch_id,sheet_no,sheet_name,row_number,message,created_at,updated_at,locale)' ||
                           ' select batch_id,sheet_no,sheet_name,0,' ||
                           '''第 ' || indexNo || ' 列,存在非数字的行''' ||
                           ',sysdate,sysdate,' || '''ZH''' || ' from ' ||
                           l_temp_table || ' t where t.batch_id = ''' ||
                           batchId || '''' || ' and rownum = 1';
      
        execute immediate l_error_sql_en;
        execute immediate l_error_sql_zhs;
    end;
  
  end validate_number;

  procedure validate_date(batchId           in varchar2,
                          templateId        in varchar2,
                          combinationRecord in varchar2,
                          indexNo           in number,
                          mmode             in varchar2,
                          args              in varchar2,
                          flag              out boolean) is
  
    l_temp_table varchar2(32);
    l_table_name varchar2(30);
  
    l_error_sql_en  varchar2(2000);
    l_error_sql_zhs varchar2(2000);
    l_sql_validate  varchar2(2000);
  
    l_count number;
  begin
    flag := true;
  
    get_template_table(templateId, l_temp_table, l_table_name);
  
    l_sql_validate := 'select count(to_date(t.cols' || indexNo ||
                      ',''YYYY-MM-DD-HH24:MI:SS'')) from ' || l_temp_table ||
                      ' t where batch_id = ''' || batchId || '''';
  
    begin
      execute immediate l_sql_validate
        into l_count;
    exception
      when others then
        flag := false;
      
        l_error_sql_en := 'insert into dip_error (batch_id,sheet_no,sheet_name,row_number,message,created_at,updated_at,locale)' ||
                          ' select batch_id,sheet_no,sheet_name,0,' ||
                          '''Column ' || indexNo ||
                          ' should be date(YYYY/MM/DD HH24:MI:SS)''' ||
                          ',sysdate,sysdate,' || '''EN''' || ' from ' ||
                          l_temp_table || ' t where t.batch_id = ''' ||
                          batchId || '''' || ' and rownum = 1';
      
        l_error_sql_zhs := 'insert into dip_error (batch_id,sheet_no,sheet_name,row_number,message,created_at,updated_at,locale)' ||
                           ' select batch_id,sheet_no,sheet_name,0,' ||
                           '''第 ' || indexNo ||
                           ' 列,存在非日期(YYYY/MM/DD HH24:MI:SS)的行''' ||
                           ',sysdate,sysdate,' || '''ZH''' || ' from ' ||
                           l_temp_table || ' t where t.batch_id = ''' ||
                           batchId || '''' || ' and rownum = 1';
      
        execute immediate l_error_sql_en;
        execute immediate l_error_sql_zhs;
    end;
  
  end validate_date;

  procedure validate_unique_1(p_temp_table in varchar2,
                              batchId      in varchar2,
                              indexNo      in number,
                              flag         out boolean) is
    l_temp_table varchar2(30);
  
    l_error_sql_en  varchar2(2000);
    l_error_sql_zhs varchar2(2000);
  begin
    flag         := true;
    l_temp_table := p_temp_table;
  
    l_error_sql_en := 'insert into dip_error (batch_id,sheet_no,sheet_name,row_number,message,created_at,updated_at,locale)' ||
                      ' select batch_id,sheet_no,sheet_name,row_number,' ||
                      '''Column ' || indexNo ||
                      ' mutiple value found in Excel''' ||
                      ',sysdate,sysdate,' || '''EN''' || ' from ' ||
                      l_temp_table || ' t where t.batch_id = ''' || batchId || '''' ||
                      ' and exists(select 1 from ' || l_temp_table ||
                      ' t2 where t2.id <> t.id and t2.batch_id = t.batch_id and t2.cols' ||
                      indexNo || ' = t.cols' || indexNo || ')';
  
    l_error_sql_zhs := 'insert into dip_error (batch_id,sheet_no,sheet_name,row_number,message,created_at,updated_at,locale)' ||
                       ' select batch_id,sheet_no,sheet_name,row_number,' ||
                       '''第 ' || indexNo || ' 列的值在Excel中出现多次''' ||
                       ',sysdate,sysdate,' || '''ZH''' || ' from ' ||
                       l_temp_table || ' t where t.batch_id = ''' ||
                       batchId || '''' || ' and exists(select 1 from ' ||
                       l_temp_table ||
                       ' t2 where t2.id <> t.id and t2.batch_id = t.batch_id and t2.cols' ||
                       indexNo || ' = t.cols' || indexNo || ')';
  
    execute immediate l_error_sql_en;
    if sql%found then
      flag := false;
      execute immediate l_error_sql_zhs;
    end if;
  end validate_unique_1;

  procedure validate_unique_2(p_temp_table in varchar2,
                              p_table_name in varchar2,
                              batchId      in varchar2,
                              indexNo      in number,
                              args         in varchar2,
                              flag         out boolean) is
    l_temp_table varchar2(30);
    l_table_name varchar2(30);
  
    l_args varchar2(2000);
  
    l_temp_col_code  varchar2(30);
    l_table_col_code varchar2(30);
    l_table_col_name varchar2(30);
  
    l_error_sql_en  varchar2(2000);
    l_error_sql_zhs varchar2(2000);
  begin
    flag         := true;
    l_temp_table := p_temp_table;
    l_table_name := p_table_name;
  
    validate_unique_1(l_temp_table, batchId, indexNo, flag);
  
    l_args := args || ',';
  
    l_temp_col_code  := substrb(l_args,
                                instrb(l_args, ',', 1, 1) + 1,
                                instrb(l_args, ',', 1, 2) -
                                instrb(l_args, ',', 1, 1) - 1);
    l_table_col_code := substrb(l_args,
                                instrb(l_args, ',', 1, 2) + 1,
                                instrb(l_args, ',', 1, 3) -
                                instrb(l_args, ',', 1, 2) - 1);
    l_table_col_name := substrb(l_args,
                                instrb(l_args, ',', 1, 3) + 1,
                                instrb(l_args, ',', 1, 4) -
                                instrb(l_args, ',', 1, 3) - 1);
  
    l_error_sql_en := 'insert into dip_error (batch_id,sheet_no,sheet_name,row_number,message,created_at,updated_at,locale)' ||
                      ' select batch_id,sheet_no,sheet_name,row_number,' ||
                      '''Column ' || indexNo ||
                      '  value alreadly exist in table''' ||
                      ',sysdate,sysdate,' || '''EN''' || ' from ' ||
                      l_temp_table || ' t where t.batch_id = ''' || batchId || '''' ||
                      ' and exists(select 1 from ' || l_table_name ||
                      ' a where a.' || l_table_col_code || ' <> t.' ||
                      l_temp_col_code || ' and a.' || l_table_col_name ||
                      ' = t.cols' || indexNo || ')';
  
    l_error_sql_zhs := 'insert into dip_error (batch_id,sheet_no,sheet_name,row_number,message,created_at,updated_at,locale)' ||
                       ' select batch_id,sheet_no,sheet_name,row_number,' ||
                       '''第 ' || indexNo || ' 列的值在正式表中已存在''' ||
                       ',sysdate,sysdate,' || '''ZH''' || ' from ' ||
                       l_temp_table || ' t where t.batch_id = ''' ||
                       batchId || '''' || ' and exists(select 1 from ' ||
                       l_table_name || ' a where a.' || l_table_col_code ||
                       ' <> t.' || l_temp_col_code || ' and a.' ||
                       l_table_col_name || ' = t.cols' || indexNo || ')';
  
    execute immediate l_error_sql_en;
    if sql%found then
      flag := false;
      execute immediate l_error_sql_zhs;
    end if;
  
  end validate_unique_2;

  procedure validate_unique_3(p_temp_table in varchar2,
                              p_table_name in varchar2,
                              batchId      in varchar2,
                              indexNo      in number,
                              args         in varchar2,
                              flag         out boolean) is
    cursor cur_1(c_args varchar2) is
      select l_count,
             substrb(col, 1, instrb(col, '.', 1, 1) - 1) table_name,
             substrb(col, instrb(col, '.', 1, 1) + 1) column_name
        from (SELECT l_count,
                     substrb(c_args,
                             instrb(c_args, ',', 1, l_count) + 1,
                             instrb(c_args, ',', 1, l_count + 1) -
                             instrb(c_args, ',', 1, l_count) - 1) col
                FROM dual,
                     (SELECT LEVEL l_count
                        FROM DUAL
                      CONNECT BY LEVEL <= LENGTHb(c_args) -
                                 LENGTHb(REPLACE(c_args, ',')) - 1))
       where l_count > 4;
  
    l_temp_table varchar2(30);
    l_table_name varchar2(30);
  
    l_args varchar2(2000);
  
    l_error_sql_en  varchar2(2000);
    l_error_sql_zhs varchar2(2000);
  begin
    flag         := true;
    l_temp_table := p_temp_table;
    l_table_name := p_table_name;
  
    validate_unique_2(l_temp_table,
                      l_table_name,
                      batchId,
                      indexNo,
                      args,
                      flag);
  
    l_args := ',' || args || ',';
  
    for lr_1 in cur_1(l_args) loop
    
      l_error_sql_en := 'insert into dip_error (batch_id,sheet_no,sheet_name,row_number,message,created_at,updated_at,locale)' ||
                        ' select batch_id,sheet_no,sheet_name,row_number,' ||
                        '''Column ' || indexNo ||
                        '  value exists in column ' || lr_1.column_name ||
                        ' of table ' || lr_1.table_name ||
                        ''',sysdate,sysdate,' || '''EN''' || ' from ' ||
                        l_temp_table || ' t where t.batch_id = ''' ||
                        batchId || '''' || ' and exists(select 1 from ' ||
                        lr_1.table_name || ' a where a.' ||
                        lr_1.column_name || ' = t.cols' || indexNo || ')';
    
      l_error_sql_zhs := 'insert into dip_error (batch_id,sheet_no,sheet_name,row_number,message,created_at,updated_at,locale)' ||
                         ' select batch_id,sheet_no,sheet_name,row_number,' ||
                         '''第 ' || indexNo || ' 列的值与表' || lr_1.table_name ||
                         ' 的列 ' || lr_1.column_name || '的值重复''' ||
                         ',sysdate,sysdate,' || '''ZH''' || ' from ' ||
                         l_temp_table || ' t where t.batch_id = ''' ||
                         batchId || '''' || ' and exists(select 1 from ' ||
                         lr_1.table_name || ' a where a.' ||
                         lr_1.column_name || ' = t.cols' || indexNo || ')';
    
      execute immediate l_error_sql_en;
      if sql%found then
        flag := false;
        execute immediate l_error_sql_zhs;
      end if;
    end loop;
  
  end validate_unique_3;

  /*
  args:
  
  1
  2,cols1,vendor_code,vendor_name
  3,cols1,vendor_code,vendor_name,supplier_table.supplier_name,supplier_table2.supplier_name
  
  */

  procedure validate_unique(batchId           in varchar2,
                            templateId        in varchar2,
                            combinationRecord in varchar2,
                            indexNo           in number,
                            mmode             in varchar2,
                            args              in varchar2,
                            flag              out boolean) is
  
    l_temp_table varchar2(32);
    l_table_name varchar2(30);
  
    l_unique_type varchar2(10);
  
    --  l_error_sql_en       varchar2(2000);
    --- l_error_sql_zhs      varchar2(2000);
  begin
    flag := true;
  
    get_template_table(templateId, l_temp_table, l_table_name);
  
    l_unique_type := substrb(args, 1, 1);
  
    if l_unique_type = 1 then
      -- 1 excel
      validate_unique_1(l_temp_table, batchId, indexNo, flag);
    elsif l_unique_type = 2 then
      -- 2 excel + table
      validate_unique_2(l_temp_table,
                        l_table_name,
                        batchId,
                        indexNo,
                        args,
                        flag);
    elsif l_unique_type = 3 then
      -- 3 excel , table.column
      validate_unique_3(l_temp_table,
                        l_table_name,
                        batchId,
                        indexNo,
                        args,
                        flag);
    else
      null;
    end if;
  
  end validate_unique;

  --validate column's value is 'Y' or 'N'
  procedure validate_y_n(batchId           in varchar2,
                         templateId        in varchar2,
                         combinationRecord in varchar2,
                         indexNo           in number,
                         mmode             in varchar2,
                         args              in varchar2,
                         flag              out boolean) is
  
    l_temp_table varchar2(32);
    l_table_name varchar2(30);
  
    l_error_sql_en  varchar2(2000);
    l_error_sql_zhs varchar2(2000);
  begin
    flag := true;
  
    get_template_table(templateId, l_temp_table, l_table_name);
  
    l_error_sql_en := 'insert into dip_error (batch_id,sheet_no,sheet_name,row_number,message,created_at,updated_at,locale)' ||
                      ' select batch_id,sheet_no,sheet_name,row_number,' ||
                      '''Column ' || indexNo || ' should be Y or N''' ||
                      ',sysdate,sysdate,' || '''EN''' || ' from ' ||
                      l_temp_table || ' t where t.batch_id = ''' || batchId || '''' ||
                      ' and t.cols' || indexNo || ' is not null ' ||
                      ' and t.cols' || indexNo || ' not in (''Y'',''N'')';
  
    l_error_sql_zhs := 'insert into dip_error (batch_id,sheet_no,sheet_name,row_number,message,created_at,updated_at,locale)' ||
                       ' select batch_id,sheet_no,sheet_name,row_number,' ||
                       '''第 ' || indexNo || ' 列,需为Y或者N''' ||
                       ',sysdate,sysdate,' || '''ZH''' || ' from ' ||
                       l_temp_table || ' t where t.batch_id = ''' ||
                       batchId || '''' || ' and t.cols' || indexNo ||
                       ' is not null ' || ' and t.cols' || indexNo ||
                       ' not in (''Y'',''N'')';
    execute immediate l_error_sql_en;
    if sql%found then
      flag := false;
      execute immediate l_error_sql_zhs;
    end if;
  
  end validate_y_n;

  procedure validate_1_0(batchId           in varchar2,
                         templateId        in varchar2,
                         combinationRecord in varchar2,
                         indexNo           in number,
                         mmode             in varchar2,
                         args              in varchar2,
                         flag              out boolean) is
  
    l_temp_table varchar2(32);
    l_table_name varchar2(30);
  
    l_error_sql_en  varchar2(2000);
    l_error_sql_zhs varchar2(2000);
  begin
    flag := true;
  
    get_template_table(templateId, l_temp_table, l_table_name);
  
    l_error_sql_en := 'insert into dip_error (batch_id,sheet_no,sheet_name,row_number,message,created_at,updated_at,locale)' ||
                      ' select batch_id,sheet_no,sheet_name,row_number,' ||
                      '''Column ' || indexNo || ' should be 1 or 0''' ||
                      ',sysdate,sysdate,' || '''EN''' || ' from ' ||
                      l_temp_table || ' t where t.batch_id = ''' || batchId || '''' ||
                      ' and t.cols' || indexNo || ' is not null ' ||
                      ' and t.cols' || indexNo || ' not in (''1'',''0'')';
  
    l_error_sql_zhs := 'insert into dip_error (batch_id,sheet_no,sheet_name,row_number,message,created_at,updated_at,locale)' ||
                       ' select batch_id,sheet_no,sheet_name,row_number,' ||
                       '''第 ' || indexNo || ' 列,需为1或者0''' ||
                       ',sysdate,sysdate,' || '''ZH''' || ' from ' ||
                       l_temp_table || ' t where t.batch_id = ''' ||
                       batchId || '''' || ' and t.cols' || indexNo ||
                       ' is not null ' || ' and t.cols' || indexNo ||
                       ' not in (''1'',''0'')';
    execute immediate l_error_sql_en;
    if sql%found then
      flag := false;
      execute immediate l_error_sql_zhs;
    end if;
  end validate_1_0;
  /*
  validate_blank_character: 验证该列不包含空格
  */
  procedure validate_blank_character(batchId           in varchar2,
                                     templateId        in varchar2,
                                     combinationRecord in varchar2,
                                     indexNo           in number,
                                     mmode             in varchar2,
                                     args              in varchar2,
                                     flag              out boolean) is
  
    l_temp_table varchar2(32);
    l_table_name varchar2(30);
  
    l_error_sql_en  varchar2(2000);
    l_error_sql_zhs varchar2(2000);
  begin
    flag := true;
  
    get_template_table(templateId, l_temp_table, l_table_name);
  
    l_error_sql_en := 'insert into dip_error (batch_id,sheet_no,sheet_name,row_number,message,created_at,updated_at,locale)' ||
                      ' select batch_id,sheet_no,sheet_name,row_number,' ||
                      '''Column ' || indexNo ||
                      ' should not have blank character''' ||
                      ',sysdate,sysdate,' || '''EN''' || ' from ' ||
                      l_temp_table || ' t where t.batch_id = ''' || batchId || '''' ||
                      ' and t.cols' || indexNo || ' is not null ' ||
                      ' and instr(t.cols' || indexNo || ',CHR(32))>0';
  
    l_error_sql_zhs := 'insert into dip_error (batch_id,sheet_no,sheet_name,row_number,message,created_at,updated_at,locale)' ||
                       ' select batch_id,sheet_no,sheet_name,row_number,' ||
                       '''第 ' || indexNo || ' 列,不能包含空格''' ||
                       ',sysdate,sysdate,' || '''ZH''' || ' from ' ||
                       l_temp_table || ' t where t.batch_id = ''' ||
                       batchId || '''' || ' and t.cols' || indexNo ||
                       ' is not null ' || ' and instr(t.cols' || indexNo ||
                       ',CHR(32))>0';
    execute immediate l_error_sql_en;
    if sql%found then
      flag := false;
      execute immediate l_error_sql_zhs;
    end if;
  end validate_blank_character;

  procedure validate_not_zero(batchId           in varchar2,
                              templateId        in varchar2,
                              combinationRecord in varchar2,
                              indexNo           in number,
                              mmode             in varchar2,
                              args              in varchar2,
                              flag              out boolean) is
  
    l_temp_table varchar2(32);
    l_table_name varchar2(30);
  
    l_error_sql_en  varchar2(2000);
    l_error_sql_zhs varchar2(2000);
  begin
    flag := true;
  
    get_template_table(templateId, l_temp_table, l_table_name);
  
    l_error_sql_en := 'insert into dip_error (batch_id,sheet_no,sheet_name,row_number,message,created_at,updated_at,locale)' ||
                      ' select batch_id,sheet_no,sheet_name,row_number,' ||
                      '''Column ' || indexNo || ' can not be zero ''' ||
                      ',sysdate,sysdate,' || '''EN''' || ' from ' ||
                      l_temp_table || ' t where t.batch_id = ''' || batchId || '''' ||
                      ' and t.cols' || indexNo || ' is not null ' ||
                      ' and t.cols' || indexNo || '=''0''';
  
    l_error_sql_zhs := 'insert into dip_error (batch_id,sheet_no,sheet_name,row_number,message,created_at,updated_at,locale)' ||
                       ' select batch_id,sheet_no,sheet_name,row_number,' ||
                       '''第 ' || indexNo || ' 列,不能为0''' ||
                       ',sysdate,sysdate,' || '''ZH''' || ' from ' ||
                       l_temp_table || ' t where t.batch_id = ''' ||
                       batchId || '''' || ' and t.cols' || indexNo ||
                       ' is not null ' || ' and t.cols' || indexNo ||
                       '=''0''';
    execute immediate l_error_sql_en;
    if sql%found then
      flag := false;
      execute immediate l_error_sql_zhs;
    end if;
  end validate_not_zero;

  /*validate_valid_string:验证开头不能包含特殊字符：&、*、@、，、{}、“、-、#、.、+、；、/*/
  procedure validate_valid_string(batchId           in varchar2,
                                  templateId        in varchar2,
                                  combinationRecord in varchar2,
                                  indexNo           in number,
                                  mmode             in varchar2,
                                  args              in varchar2,
                                  flag              out boolean) is
  
    l_temp_table varchar2(32);
  
    l_update_tmp_sql varchar2(2000);
  
    l_error_sql_en  varchar2(2000);
    l_error_sql_zhs varchar2(2000);
  begin
    flag := true;
  
    l_temp_table := get_template_table(templateId);
  
    /*验证该列是否是大小写字母数字和下划线的组合
    l_error_sql_en := 'insert into dip_error (batch_id,sheet_no,sheet_name,row_number,message,created_at,updated_at,locale)' ||
                      ' select batch_id,sheet_no,sheet_name,row_number,' ||
                      '''Column ' || indexNo ||
                      ' is not valid, should be the combination of number, letter and underline''' ||
                      ',sysdate,sysdate,' || '''EN''' || ' from ' ||
                      l_temp_table || ' t where t.batch_id = ''' || batchId || '''' ||
                      ' and t.cols' || indexNo || ' is not null ' ||
                      ' and REGEXP_COUNT(t.cols' || indexNo ||
                      ', ''^([]a-zA-Z0-9_[]+)$'')=0';
    
    l_error_sql_zhs := 'insert into dip_error (batch_id,sheet_no,sheet_name,row_number,message,created_at,updated_at,locale)' ||
                       ' select batch_id,sheet_no,sheet_name,row_number,' ||
                       '''第 ' || indexNo || ' 列，取值非法,编码只能为大小写字母数字和下划线的组合''' ||
                       ',sysdate,sysdate,' || '''ZH''' || ' from ' ||
                       l_temp_table || ' t where t.batch_id = ''' ||
                       batchId || '''' || ' and t.cols' || indexNo ||
                       ' is not null ' || ' and REGEXP_COUNT(t.cols' ||
                       indexNo || ', ''^([]a-zA-Z0-9_[]+)$'')=0';*/
    l_error_sql_en := 'insert into dip_error (batch_id,sheet_no,sheet_name,row_number,message,created_at,updated_at,locale)' ||
                      ' select batch_id,sheet_no,sheet_name,row_number,' ||
                      '''Column ' || indexNo ||
                      ' is not valid, can not start with special characters ''' ||
                      ',sysdate,sysdate,' || '''EN''' || ' from ' ||
                      l_temp_table || ' t where t.batch_id = ''' || batchId || '''' ||
                      ' and t.cols' || indexNo || ' is not null ' ||
                      ' and REGEXP_COUNT(substr(t.cols' || indexNo ||
                      ',1,1), ''^([][:alpha:]0-9_[]+)$'') = 0';
  
    l_error_sql_zhs := 'insert into dip_error (batch_id,sheet_no,sheet_name,row_number,message,created_at,updated_at,locale)' ||
                       ' select batch_id,sheet_no,sheet_name,row_number,' ||
                       '''第 ' || indexNo || ' 列，取值非法,开头不能包含特殊字符''' ||
                       ',sysdate,sysdate,' || '''ZH''' || ' from ' ||
                       l_temp_table || ' t where t.batch_id = ''' ||
                       batchId || '''' || ' and t.cols' || indexNo ||
                       ' is not null ' || ' 
                        and REGEXP_COUNT(substr(t.cols' ||
                       indexNo || ',1,1), ''^([][:alpha:]0-9_[]+)$'') = 0';
  
    execute immediate l_error_sql_en;
    if sql%found then
      flag := false;
      execute immediate l_error_sql_zhs;
    end if;
  end validate_valid_string;

  /*validate_value_set0: 判断该列数据是否在对应值集（通过args传入对应的键编码）的描述中
  存code导描述，页面显示描述*/
  procedure validate_value_set0(batchId           in varchar2,
                                templateId        in varchar2,
                                combinationRecord in varchar2,
                                indexNo           in number,
                                mmode             in varchar2,
                                args              in varchar2,
                                flag              out boolean) is
  
    l_temp_table     varchar2(32);
    l_value_set_name varchar2(80);
    l_update_tmp_sql varchar2(2000);
  
    l_error_sql_en  varchar2(2000);
    l_error_sql_zhs varchar2(2000);
  begin
    flag := true;
  
    l_temp_table     := get_template_table(templateId);
    l_update_tmp_sql := 'update ' || l_temp_table || ' t set t.cols' ||
                        (indexNo + 1000) ||
                        ' = (select v.code from com_value_manage_v v where v.description = t.cols' ||
                        indexNo || ' and v.type = ''' || args || ''') ' ||
                        ' where t.batch_id = ''' || batchId || '''';
  
    execute immediate l_update_tmp_sql;
  
    select t.name
      into l_value_set_name
      from dip_header t
     where t.code = args;
  
    l_error_sql_en := 'insert into dip_error (batch_id,sheet_no,sheet_name,row_number,message,created_at,updated_at,locale)' ||
                      ' select batch_id,sheet_no,sheet_name,row_number,' ||
                      '''Column ' || indexNo ||
                      ' is not valid, should be the right desc of value set named ' ||
                      l_value_set_name || '''' || ',sysdate,sysdate,' ||
                      '''EN''' || ' from ' || l_temp_table ||
                      ' t where t.batch_id = ''' || batchId || '''' ||
                      ' and t.cols' || indexNo || ' is not null ' ||
                      ' and t.cols' || (indexNo + 1000) || ' is null';
  
    l_error_sql_zhs := 'insert into dip_error (batch_id,sheet_no,sheet_name,row_number,message,created_at,updated_at,locale)' ||
                       ' select batch_id,sheet_no,sheet_name,row_number,' ||
                       '''第 ' || indexNo || ' 列,应为值集' || l_value_set_name ||
                       '的描述列成员.''' || ',sysdate,sysdate,' || '''ZH''' ||
                       ' from ' || l_temp_table ||
                       ' t where t.batch_id = ''' || batchId || '''' ||
                       ' and t.cols' || indexNo || ' is not null ' ||
                       ' and t.cols' || (indexNo + 1000) || ' is null';
  
    execute immediate l_error_sql_en;
    if sql%found then
      flag := false;
      execute immediate l_error_sql_zhs;
    end if;
  end validate_value_set0;
  /*validate_value_set1: 判断该列数据是否在对应值集（通过args传入对应的键编码,这种值集的code和描述是相同的）
  ）的code中,存code导code，页面显示code*/
  procedure validate_value_set1(batchId           in varchar2,
                                templateId        in varchar2,
                                combinationRecord in varchar2,
                                indexNo           in number,
                                mmode             in varchar2,
                                args              in varchar2,
                                flag              out boolean) is
  
    l_temp_table     varchar2(32);
    l_value_set_name varchar2(80);
  
    l_update_tmp_sql varchar2(2000);
  
    l_error_sql_en  varchar2(2000);
    l_error_sql_zhs varchar2(2000);
  begin
    flag := true;
  
    l_temp_table := get_template_table(templateId);
  
    select t.name
      into l_value_set_name
      from dip_header t
     where t.code = args;
  
    l_error_sql_en := 'insert into dip_error (batch_id,sheet_no,sheet_name,row_number,message,created_at,updated_at,locale)' ||
                      ' select batch_id,sheet_no,sheet_name,row_number,' ||
                      '''Column ' || indexNo ||
                      ' is not valid, should be the right code of value set named ' ||
                      l_value_set_name || '''' || ',sysdate,sysdate,' ||
                      '''EN''' || ' from ' || l_temp_table ||
                      ' t where t.batch_id = ''' || batchId || '''' ||
                      ' and t.cols' || indexNo || ' is not null ' ||
                      ' and not exists (select v.code from com_value_manage_v v 
                        where t.cols' || indexNo ||
                      ' = v.code and v.type = ''' || args || ''')';
  
    l_error_sql_zhs := 'insert into dip_error (batch_id,sheet_no,sheet_name,row_number,message,created_at,updated_at,locale)' ||
                       ' select batch_id,sheet_no,sheet_name,row_number,' ||
                       '''第 ' || indexNo || ' 列,应为值集' || l_value_set_name ||
                       '的编码列成员.''' || ',sysdate,sysdate,' || '''ZH''' ||
                       ' from ' || l_temp_table ||
                       ' t where t.batch_id = ''' || batchId || '''' ||
                       ' and t.cols' || indexNo || ' is not null ' ||
                       ' and not exists (select v.code from com_value_manage_v v 
                        where t.cols' || indexNo ||
                       ' = v.code and v.type = ''' || args || ''')';
  
    execute immediate l_error_sql_en;
    if sql%found then
      flag := false;
      execute immediate l_error_sql_zhs;
    end if;
  end validate_value_set1;
   /*
  validate_col_length: 验证该列长度不超过XX字符数
  参考args: 80
  80表示该列长度不超过80个字符
  */
  procedure validate_col_length(batchId           in varchar2,
                                templateId        in varchar2,
                                combinationRecord in varchar2,
                                indexNo           in number,
                                mmode             in varchar2,
                                args              in varchar2,
                                flag              out boolean) is
  
    l_temp_table varchar2(32);
  
    l_update_tmp_sql varchar2(2000);
  
    l_error_sql_en  varchar2(2000);
    l_error_sql_zhs varchar2(2000);
  begin
    flag := true;
  
    l_temp_table := get_template_table(templateId);
  
    l_error_sql_en := 'insert into dip_error (batch_id,sheet_no,sheet_name,row_number,message,created_at,updated_at,locale)' ||
                      ' select batch_id,sheet_no,sheet_name,row_number,' ||
                      '''Column ' || indexNo ||
                      ' is not valid, should be the right code of value set''' ||
                      ',sysdate,sysdate,' || '''EN''' || ' from ' ||
                      l_temp_table || ' t where t.batch_id = ''' || batchId || '''' ||
                      ' and t.cols' || indexNo || ' is not null ' ||
                      ' and exists (select 1 from dual 
                        where length(t.cols' ||
                      indexNo || ') >' || args || ')';
  
    l_error_sql_zhs := 'insert into dip_error (batch_id,sheet_no,sheet_name,row_number,message,created_at,updated_at,locale)' ||
                       ' select batch_id,sheet_no,sheet_name,row_number,' ||
                       '''第 ' || indexNo || ' 列，取值非法,应为对应值集的CODE''' ||
                       ',sysdate,sysdate,' || '''ZH''' || ' from ' ||
                       l_temp_table || ' t where t.batch_id = ''' ||
                       batchId || '''' || ' and t.cols' || indexNo ||
                       ' is not null and exists (select 1 from dual 
                        where length(t.cols' ||
                       indexNo || ') >' || args || ')';
  
    execute immediate l_error_sql_en;
    if sql%found then
      flag := false;
      execute immediate l_error_sql_zhs;
    end if;
  end validate_col_length;

  /*
  validate_col_valid: 验证某列取值是否在其他表的某列上
  参数args样例：HP_DIM_ATTRIBUTE,ATTRIBUTE
  warning: 当多张模板的真实表对应都是目标表时，需修改procedure
  */
  procedure validate_col_valid(batchId           in varchar2,
                               templateId        in varchar2,
                               combinationRecord in varchar2,
                               indexNo           in number,
                               mmode             in varchar2,
                               args              in varchar2,
                               flag              out boolean) is
  
    l_temp_table varchar2(32);
  
    l_table          varchar2(32);
    l_table_desc     varchar2(80);
    l_col            varchar2(32);
    l_col_desc       varchar2(80);
    l_update_tmp_sql varchar2(2000);
  
    l_error_sql_en  varchar2(2000);
    l_error_sql_zhs varchar2(2000);
  begin
    flag := true;
  
    l_temp_table := get_template_table(templateId);
    l_table      := substrb(args, 1, instrb(args, ',', 1, 1) - 1);
    l_col        := substrb(args,
                            instrb(args, ',', 1, 1) + 1,
                            lengthb(args) - instrb(args, ',', 1, 1));
  
    select t.name, t1.name
      into l_table_desc, l_col_desc
      from dip_template t, dip_template_column t1
     where t.id = t1.template_id
       and t.table_name = upper(l_table)
       and t1.column_name = upper(l_col)
       and rownum < 2;
  
    l_error_sql_en := 'insert into dip_error (batch_id,sheet_no,sheet_name,row_number,message,created_at,updated_at,locale)' ||
                      ' select batch_id,sheet_no,sheet_name,row_number,' ||
                      '''Column ' || indexNo ||
                      ' is not valid, should be in the ' || l_col_desc ||
                      ' of ' || l_table_desc || '''' || ',sysdate,sysdate,' ||
                      '''EN''' || ' from ' || l_temp_table ||
                      ' t where t.batch_id = ''' || batchId || '''' ||
                      ' and t.cols' || indexNo || ' is not null ' ||
                      ' and not exists (select 1 from ' || l_table || ' t1
                        where t.cols' || indexNo ||
                      ' = t1.' || l_col || ' )';
  
    l_error_sql_zhs := 'insert into dip_error (batch_id,sheet_no,sheet_name,row_number,message,created_at,updated_at,locale)' ||
                       ' select batch_id,sheet_no,sheet_name,row_number,' ||
                       '''第 ' || indexNo || ' 列,取值非法,需为' || l_table_desc ||
                       '模板的' || l_col_desc || '列里的值 ''' ||
                       ',sysdate,sysdate,' || '''ZH''' || ' from ' ||
                       l_temp_table || ' t where t.batch_id = ''' ||
                       batchId || '''' || ' and t.cols' || indexNo ||
                       ' is not null and not exists (select 1 from ' ||
                       l_table || ' t1
                        where t.cols' || indexNo ||
                       ' = t1.' || l_col || ' )';
  
    execute immediate l_error_sql_en;
    if sql%found then
      flag := false;
      execute immediate l_error_sql_zhs;
    end if;
  end validate_col_valid;
  end HDM_COMMON_DATA_VALIDATION;
}

    execute %{
    create or replace package body HDM_DATA_VALUE is

      /*procedure get_value(combinationRecord in varchar2,
                          dataInput         in varchar2,
                          cur               out cur_type) is
      begin
        open cur for
          select t.a "value", t.b "text" from hdcm_test t where t.a like '''%'||dataInput||'''%' and rownum <= 10;
      end get_value;*/
    end HDM_DATA_VALUE;
  }

    execute %{
    create or replace package HDM_COMMON_LOG is

    /* $Header: hdmcls.pls 2.3 2013/04/25 17:00:03 steven ship $ */

    /*

       Copyright (c) 2013 by Hand Corporation

       NAME
         hdm_common_log - PL/SQL Package for data import
       DESCRIPTION
         This package performs logs functions in HDM
       NOTES
         This package must be used under hdm.
       HISTORY                            (YYYY/MM/DD) Description
         steven.gu                        2013/04/01  Creation

    */

    procedure log( p_batch_id     varchar2,
                   p_message      varchar2,
                   p_locale       varchar2,
                   p_sheet_name   varchar2 default 0,
                   p_sheet_no     number   default 0,
                   p_row_num      number   default 0);


    end HDM_COMMON_LOG;

            }

    execute %{
    create or replace package body HDM_COMMON_LOG is

      /* $Header: hdmclp.pls 2.3 2013/04/25 17:00:03 steven ship $ */

      /*

         Copyright (c) 2013 by Hand Corporation

         NAME
           hdm_common_log - PL/SQL Package for data import
         DESCRIPTION
           This package performs logs functions in HDM
         NOTES
           This package must be used under hdm.
         HISTORY                            (YYYY/MM/DD) Description
           steven.gu                        2013/04/01  Creation

      */

      procedure log( p_batch_id     varchar2,
                     p_message      varchar2,
                     p_locale       varchar2,
                     p_sheet_name   varchar2 default 0,
                     p_sheet_no     number   default 0,
                     p_row_num      number   default 0)
      is
      begin
        insert into dip_error( batch_id,
                               row_number,
                               message,
                               created_at,
                               updated_at,
                               locale,
                               sheet_name,
                               sheet_no)
                     values ( p_batch_id,
                              p_row_num,
                              substrb(p_message,1,255),
                              sysdate,
                              sysdate,
                              p_locale,
                              p_sheet_name,
                              p_sheet_no);

      end log;
      end HDM_COMMON_LOG;
    }
  end

  def down
  end
end
