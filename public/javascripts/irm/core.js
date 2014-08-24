// irm模块公共的方法
YUI.add('irm', function(Y) {

    Y.namespace('irm');

    Y.irm.publisher = new Y.EventTarget();
    Y.irm.publisher.publish('irm:change', {
      broadcast: 1,   // instance level notification
      emitFacade: true // emit a facade so we get the event target
    });

    Y.irm.setAttribute = function(name,value,type){
      this[name] = value;
      Y.irm.publisher.fire("irm:change",name,value,type);
    };

    Y.irm.handleClick = function(){
        Y.one("#content").addClass("ccc");
      };
    //表格模板formatter
    // {tbody, tr, td, classnames, headers, rowindex, record, column, data, value}
    Y.irm.template = function(o){
       var templateNode = this._parentNode.one("#"+o.column.get("key"));
       if(!templateNode){
         templateNode = this._parentNode.one("."+o.column.get("key"));
       }
       if(templateNode){
         return Y.Lang.substitute(unescape(templateNode.get('innerHTML')),o.data);
       }
       else{
           return o.value;
       }
    };
    Y.irm.stemplate = function(o){
       var templateNode = this._parentNode.one("#"+o.column.get("key"));
       if(!templateNode){
         templateNode = this._parentNode.one("."+o.column.get("key"));
       }
       if(templateNode){
         scriptString =  Y.Lang.substitute(unescape(templateNode.get('innerHTML')),o.data);
         scriptString = scriptString.replace(/&amp;/g,"&");
         scriptString = scriptString.replace(/&gt;/g,">");
         scriptString = scriptString.replace(/&lt;/g,"<");
         return eval(scriptString)
       }
       else{
          return o.value;
       }
    };
    Y.irm.htmlDecode = function(input){
      var e = document.createElement('div');
      e.innerHTML = input;
      return e.childNodes[0].nodeValue;
    }
    //表格显示行号列
    Y.irm.rownum = function(o){
      return o.rowindex;
    };

    //设置页面导航树
    Y.irm.navTree = function(domid,p_current_menus){
        var current_menus = p_current_menus;
        //get default opened menu from cookie
        var menu_cookie = Y.Cookie.get("navTreeMenu");
        var cookie_menus =[];
        if(menu_cookie){
          cookie_menus =  menu_cookie.split(",");
        }
        else{
          Y.Cookie.set("navTreeMenu", "",{ path:"/"});
        }
        current_menus = current_menus.concat(cookie_menus);

        // 处理展开事件
        Y.one("#"+domid).delegate("click",function(e){
          if(this.hasClass("NavTreeCol")){
            this.removeClass("NavTreeCol");
            this.addClass("NavTreeExp");
            Y.one('#tree_'+this.getAttribute("real")+"_child").setStyle("display","block");
            var menu_code =  this.getAttribute("real");
            var menu_cookie = Y.Cookie.get("navTreeMenu");
            if(menu_cookie.indexOf(menu_code)<0){
              if(menu_cookie.length>0)
              {
                  menu_cookie = menu_cookie+","+menu_code;
              }
              else
              {
                  menu_cookie = menu_code;
              }
              Y.Cookie.set("navTreeMenu",menu_cookie,{ path:"/"});
            }
          }
          else{
            this.removeClass("NavTreeExp");
            this.addClass("NavTreeCol");
            Y.one('#tree_'+this.getAttribute("real")+"_child").setStyle("display","none");
            var menu_code =  this.getAttribute("real");
            var menu_cookie = Y.Cookie.get("navTreeMenu");
            menu_cookie = menu_cookie.replace(","+menu_code,"")
            menu_cookie = menu_cookie.replace(menu_code+",","")
            Y.Cookie.set("navTreeMenu",menu_cookie,{ path:"/"});
          }

        },".NavIconLink")
        //选中当前页面的结点
        Y.one("#"+domid).all(".parent").each(function(n){
          for(var i = 0;i<current_menus.length;i++){
            var selectedNode = n.one("a.NavIconLink[real='"+current_menus[i]+"']");
            if(selectedNode){
              if(n.one(".NavIconLink")&&n.one(".NavIconLink").hasClass("NavTreeCol"))
                n.one(".NavIconLink").simulate("click")
            }
          }
        });
          for(var i = 0;i<current_menus.length;i++){
            Y.log("div.setupLeaf[mi="+current_menus[i]+"]");
            var selectedNode = Y.one("#"+domid).one("div.setupLeaf[ti="+current_menus[i]+"]");
            if(selectedNode){
              selectedNode.addClass("setupHighlightLeaf");
            }
          }
    };
    //表格过过滤器
    Y.irm.ViewFilter = function (domid){
       Y.on("irm:change",function(e){
           Y.one("#"+domid).all("select.viewFilter").each(function(n){
             if(e.details[2]=="Datatable"&&n.getAttribute("ref")==e.details[0])
             {
               var datasource = e.details[1].datasource;
               Y.one("#"+n.get("id")+"Overview").setStyle("display","block");
               datasource.filter({_view_filter_id:n.get("value")});
               n.on("change",function(e){
                   datasource.filter({_view_filter_id:n.get("value")});
               });
               Y.one("#"+n.get("id")+"EditLink").on("click",function(e){
                   if(!this.getAttribute("thref")){
                      this.setAttribute("thref",this.getAttribute("href"));
                   }
                   var href = decodeURIComponent(this.getAttribute("thref"));
                   href = Y.Lang.substitute(href,{id:n.get("value")});
                   this.setAttribute("href",href);
                   if(!n.get("value"))
                    e.preventDefault()
               });
             }
           });
       });
    };
    //表格过过滤器编辑逻辑
    Y.irm.rawConditionClause = function (e){
        var content = Y.one("#rawConditionClause").get("value");
        var addition = e.target.getAttribute("ref");
        content = content.replace(/\s*$/,"");
        content = content.replace(/^\s*/,"");
        var re = new RegExp(e.target.getAttribute("ref"));
        var m = re.exec(content);
        if(e.target.get("value"))
        {
            if(m == null){

              if(new RegExp("\\d+").exec(content)!=null)
                addition = " AND "+ addition;
              Y.one("#rawConditionClause").set("value",content+ addition);
            }
        }
        else
        {
          if(m != null){
            var originLength = content.length;
            if(m.index ==0){
              var rp = new RegExp(addition+"\\s*AND\\s*");
              content = content.replace(rp,"");
              rp = new RegExp(addition+"\\s+OR\\s*");
              content = content.replace(rp,"");
              if(originLength == content.length)
                content = content.replace(re,"");
            }
            else{
              var rp = new RegExp("AND\\s*"+addition+"\\s*");
              content = content.replace(rp,"");
              rp = new RegExp("OR\\s*"+addition+"\\s*");
              content = content.replace(rp,"");
              if(originLength == content.length)
                content = content.replace(re,"");
            }
            Y.one("#rawConditionClause").set("value",content);
          }
        }
      };

    Y.irm.refreshFilterOptions = function(e) {
        var obj;
        var seq_num = e.currentTarget.getAttribute("ref");
        var attribute_id = "";
        if(e.currentTarget.getData("dispatcher")){
          obj = e.currentTarget.getData("dispatcher")
        }else{

          obj = new Y.Dispatcher({node:"#filter"+seq_num});
          e.currentTarget.setData("dispatcher",obj);
        }

        if(e.currentTarget.get("value")&&e.currentTarget.get("value")!=""){
           attribute_id = e.target.one("option[value="+e.target.get("value")+"]").getAttribute("attribute_id")
         }
        var url = unescape(Y.one("#filterContent").getAttribute("href"));
        url = Y.Lang.substitute(url,{seq_num:seq_num,attribute_id:attribute_id});

        obj.set('uri', url);

	  };

}, '0.1.1' /* module version */, {
    requires: ['base',"overlay","cookie","node-event-simulate","event-custom","event-mouseenter"]
});