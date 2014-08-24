$(function () {

    //BEGIN========================全局ajax事件监听========================================
    $(document).ajaxSend(function (event, jqXHR, ajaxOptions) {
        var _dom_id = get_dom_id(ajaxOptions);
        if (typeof _dom_id != 'undefined' && _dom_id != null && _dom_id.length > 0) {
            $("#" + _dom_id).addClass("table-placeholder");
            $("#" + _dom_id).mask($.i18n("processing"));
        } else {
            $("body").mask($.i18n("processing"));
        }
    });
    $(document).ajaxSuccess(function (event, jqXHR, ajaxOptions) {
    });
    $(document).ajaxError(function (event, jqXHR, ajaxOptions, error) {
    });
    $(document).ajaxComplete(function (event, jqXHR, ajaxOptions) {
        var _dom_id = get_dom_id(ajaxOptions);
        if (typeof _dom_id != 'undefined' && _dom_id != null && _dom_id.length > 0) {
            $("#" + _dom_id).removeClass("table-placeholder");
            $("#" + _dom_id).unmask();
        } else {
            $("body").unmask();
        }
    });
    //END========================全局ajax事件监听========================================
    $("*[required]").each(function (i, e) {
        e.removeAttribute("required");
        $(e).attr("irequired", true);
    });
    //BEGIN========================系统全局初始化========================================
    $('form a[type=submit]').bind('click', function (e) {
        parent_forms = $(this).parents("form");
        e.preventDefault();

        if ($(this).attr("disabled")) {
            return
        }
        if (parent_forms[0]) {
            //对a的属性设置为target=_blank做特殊处理
            if ($(this).attr("target") == '_blank' && typeof $(parent_forms[0]).attr('nomask') == 'undefined') {
                $(parent_forms[0]).attr('from_blank', 'true').attr('nomask', 'true');
            } else if ($(parent_forms[0]).attr('from_blank')) {
                $(parent_forms[0]).removeAttr('from_blank').removeAttr('nomask');
            }
            $(parent_forms[0]).trigger("submit");
        }
    });

    $('form a.submit').bind('click', function (e) {
        href = $(this).attr("href");
        parent_forms = $(this).parents("form");
        e.preventDefault();
        if ($(this).attr("disabled")) {
            return
        }

        if (parent_forms[0]) {
            var origin_target = $(parent_forms[0]).attr("target");
            var origin_action = $(parent_forms[0]).attr("action");
            if ($(this).attr("target"))
                $(parent_forms[0]).attr("target", $(this).attr("target"));
            else
                $(parent_forms[0]).removeAttr("target");
            $(parent_forms[0]).attr("action", href);
            //对a的属性设置为target=_blank做特殊处理
            if ($(this).attr("target") == '_blank' && typeof $(parent_forms[0]).attr('nomask') == 'undefined') {
                $(parent_forms[0]).attr('from_blank', 'true').attr('nomask', 'true');
            } else if ($(parent_forms[0]).attr('from_blank')) {
                $(parent_forms[0]).removeAttr('from_blank').removeAttr('nomask');
            }
            $(parent_forms[0]).trigger("submit");

            if (origin_target)
                $(parent_forms[0]).attr("target", origin_target);
            else
                $(parent_forms[0]).removeAttr("target");
            if ($(this).attr("target")) {
                $(parent_forms[0]).attr("action", origin_action);
            }
        }
    });

    $('input[irm_uppercase]').bind('keyup', function (event) {
        $(this).val($(this).val().toUpperCase().replace(/^(_+)|[^A-Z_]/g, ""));
    });

    $('input[irm_uppercase]').each(function (index, n) {
        $(n).attr("autocomplete", "off");
    });

    $('input[irm_chr_only]').bind('keyup', function (event) {
        $(this).val($(this).val().replace(/^(_+)|^( +)|[^A-Z a-z0-9_]/g, ""));
    });

    $('input[irm_chr_only]').each(function (index, n) {
        $(n).attr("autocomplete", "off");
    });

    $('input[irm_number_only]').bind('keyup', function (event) {
        $(this).val($(this).val().replace(/[^0-9]/g, ""));
    });

    $('input[irm_number_and_cross]').bind('keyup', function (event) {
        $(this).val($(this).val().replace(/[^- 0-9]/g, ""));
    });

    $('input[irm_number_and_cross]').each(function (index, n) {
        $(n).attr("autocomplete", "off");
    });

    $('input[irm_number_only]').each(function (index, n) {
        $(n).attr("autocomplete", "off");
    });


    $('input[jrequired]').each(function (index, n) {
        var parent_node = $(n).parent();
        var node = '<div class="requiredInput"><div class="requiredBlock"></div>' + $(parent_node).html() + '</div>';
        $(parent_node).html(node);
    });
    $("*[jrequired]").each(function (i, e) {
        e.removeAttribute("jrequired");
    });

    /*只允许输入小数*/
    $('input[irm_pos_real_number]').bind('keypress', function (event) {
        if (!$.browser.mozilla) {
            if (event.keyCode && (event.keyCode < 48 || event.keyCode > 57) && event.keyCode != 46)
                event.preventDefault();
        }
        else {
            if (event.charCode && (event.charCode < 48 || event.charCode > 57) && event.charCode != 46)
                event.preventDefault();
        }
        $(this).attr("autocomplete", "off");
    });

    $('input[irm_pos_real_number]').bind('blur', function (event) {
        var input = $(this);
        var v = $.trim(input.val());
        var reg = new RegExp("^[0-9]+(.[0-9]{1,3})?$", "g");
        if (!reg.test(v)) {
            input.val("0");
        }
    });
    $('form:not([data-remote])').bind("submit", function (e) {
        if ($(this).attr("nomask")) {
            $(e.target).find("input[type=submit]").each(function (index, el) {
                $(el).attr("disabled", true);
                $(el).addClass("disabled");
                $(el).attr("value", $.i18n("processing"));
            });
        }
        else {
            if (!$(e.target).hasClass("masked")) {
                $(e.target).mask($.i18n("processing"));
            }
        }

        //$(e.target).find("input[type=submit]").each(function(index,el){
        //    $(el).attr("disabled",true);
        //    $(el).addClass("disabled");
        //    $(el).attr("value",$.i18n("processing"));
        //});
        //$(e.target).find("div.button a").each(function(index,el){
        //    $(el).attr("disabled",true);
        //    $(el).attr("onclick","alert('"+$.i18n("processing")+"');return false;");
        //    $(el).addClass("disabled");
        //    $(el).html($.i18n("processing"));
        //});
    });

    $('a[disabled]').each(function (index, n) {
        $(n).addClass("disabled");
        n.removeAttribute("disabled");
        $(n).attr("href", "javascript:void(0);");
    });

    if ($.fn.datePicker) {
        $("input.date").each(function (i, e) {
            var options = {};
            if (!$(e).attr("future")) {
                options["startDate"] = new Date(1996, 1, 1);
            }
            if ($(e).attr("nobutton")) {
                options["createButton"] = false;
            }
            if ($(e).attr("today")) {
                $(e).datePicker(options).val(new Date().asString()).trigger('change');
            }
            else {
                $(e).datePicker(options);
            }
            $(e).bind("click", function (event) {
                $(this).dpDisplay();
            })
            $(e).bind("keyup", function (event) {
                if (event.keyCode == "9") {
                    $(this).dpDisplay();
                }
            })
            $(e).bind("keydown", function (event) {
                if (event.keyCode == "9") {
                    $(this).dpClose();
                }
            })

        });
    }
    //如果下拉列表中只有一个可选值,且当前值是空值,自动选择第一个选项
    $("select[irequired]:not([depend])").each(function (index, element) {
        if ($(element).val() != "") {
            return
        }
        var options = $(element).find("option");
        if (options.length == 2 && $(options[0]).attr("value") == "" && $(options[1]).attr("value") != "") {
            $(element).val($(options[1]).attr("value"));
        }
    });
    //对select进行渲染,添加查询功能
    checkSelect();
    //对文件大小进行校验
    $("input[type=file]").bind({change:function () {
        checkAttachment(this, 1024 * 1024 * 1024);
    }});
});

var autoChooseFirst = function (element) {
    if ($(element).val() != "") {
        return
    }
    var options = $(element).find("option");
    if (options.length == 2 && $(options[0]).attr("value") == "" && $(options[1]).attr("value") != "") {
        $(element).val($(options[1]).attr("value"));
    }
};

//BEGIN========================过滤器 帮助函数========================================
var rawConditionClause = function (clause_dom_id, e) {
    var content = $("#" + clause_dom_id).val();
    var addition = e.target.getAttribute("ref");
    content = content.replace(/\s*$/, "");
    content = content.replace(/^\s*/, "");
    var re = new RegExp(e.target.getAttribute("ref"));
    var m = re.exec(content);
    if ($(e.target).val()) {
        if (m == null) {

            if (new RegExp("\\d+").exec(content) != null)
                addition = " AND " + addition;
            $("#" + clause_dom_id).val(content + addition);
        }
    }
    else {
        if (m != null) {
            var originLength = content.length;
            if (m.index == 0) {
                var rp = new RegExp(addition + "\\s*AND\\s*");
                content = content.replace(rp, "");
                rp = new RegExp(addition + "\\s+OR\\s*");
                content = content.replace(rp, "");
                if (originLength == content.length)
                    content = content.replace(re, "");
            }
            else {
                var rp = new RegExp("AND\\s*" + addition + "\\s*");
                content = content.replace(rp, "");
                rp = new RegExp("OR\\s*" + addition + "\\s*");
                content = content.replace(rp, "");
                if (originLength == content.length)
                    content = content.replace(re, "");
            }
            $("#" + clause_dom_id).val(content);
        }
    }
};

var refreshFilterOptions = function (container, e) {
    var con = $("#" + container);
    var currentTarget = $(e.currentTarget);
    var seq_num = currentTarget.attr("ref");
    var attribute_id = "";
    var refreshNode = $("#filter" + seq_num);

    if (currentTarget.val() && currentTarget.val() != "") {
        attribute_id = $(e.target).find("option[value=" + $(e.target).val() + "]:first").attr("attribute_id")
    }
    var url = decodeURIComponent(con.attr("href"));
    url = url.replace("{seq_num}", seq_num);
    url = url.replace("{attribute_id}", attribute_id);

    var placeholderTr = refreshNode.parent().find("tr.placehoder:first");
    if (placeholderTr.length < 1) {
        placeholderTr = refreshNode.parent().append("<tr class='placehoder'></tr>")
        placeholderTr = placeholderTr.find("tr.placehoder:first");
    }
    placeholderTr.load(url, function () {
        refreshNode.find("td.operator-col:first").after(placeholderTr.find("td.operator-col:first"));
        refreshNode.find("td.operator-col:first").remove();
        refreshNode.find("td.value-col:first").after(placeholderTr.find("td.value-col:first"));
        refreshNode.find("td.value-col:first").remove();
    });
};

//END========================过滤器 帮助函数========================================
//BEGIN========================LOOKUP lov 帮助函数========================================
//openLookup('/_ui/common/data/LookupPage?lkfm=editPage&lknm=acc3&lktp=' + getElementByIdCS('acc3_lktp').value,670,'1','&lksrch=' + escapeUTF(getElementByIdCS('acc3').value.substring(0, 80)))
var curPopupWindow, lastMouseX = 0, lastMouseY = 0;

function setLastMousePosition(a) {
    if (navigator.appName.indexOf("Microsoft") != -1) a = window.event;
    lastMouseX = a.screenX;
    lastMouseY = a.screenY
}

function openLookup(url, width) {
    openPopup(url, "lookup", 350, 480, "width=" + width + ",height=480,left=" + (screen.width - width) / 2 + ",top=" + (screen.height - 480) + ",toolbar=no,status=no,directories=no,menubar=no,resizable=yes,scrollable=no", true)
}

function openPopup(url, name, positionX, positionY, frameParams) {
    closePopup();
    if (lastMouseX - positionX < 0) lastMouseX = positionX;
    if (lastMouseY + positionY > screen.height) lastMouseY -= lastMouseY + positionY + 50 - screen.height;
    lastMouseX -= positionX;
    lastMouseY += 10;
    frameParams += ",screenX=" + lastMouseX + ",left=" + lastMouseX + ",screenY=" + lastMouseY + ",top=" + lastMouseY

    curPopupWindow = window.open(url, name, frameParams, false);
    curPopupWindow.focus();
    $(window).bind("focus", closePopup);
}

function closePopup() {
    if (curPopupWindow != null) {
        try {
            if (curPopupWindow.confirmOnClose) if (curPopupWindow.confirm(curPopupWindow.confirmOnCloseLabel)) {
                curPopupWindow.confirmOnClose = false;
                curPopupWindow.focus();
                return false
            }
            curPopupWindow.close()
        } catch (a) {
        }
        $(window).unbind("focus", closePopup);
        curPopupWindow = null;

    }
}

function lookupPick(fieldId, value, valueLabel, data) {
    $("#" + fieldId).val(value);
    $("#" + fieldId + "_label").val(valueLabel);
    $("#" + fieldId + "_label").focus();
    $("#" + fieldId).data("lov", data);
    $("#" + fieldId).trigger("change");
    closePopup();
}

function clearLookup(fieldId) {
    //$("#"+fieldId+"_label").val("");
    $("#" + fieldId).val("");
    $("#" + fieldId).trigger("change");
}

function setLookupValue(fieldId, value) {
    var url = $("#" + fieldId).attr("href");
    url = url.replace("lov?", "lov_value?");
    url = url + "&lkval=" + value;
    //获取当前的form表单
    var parent_forms = $("#" + fieldId).parents("form");
    var dom_id = $(parent_forms[0]).attr("id");
    $.getJSON(url, {_dom_id:dom_id}, function (data) {
        $("#" + fieldId).val(data.value);
        $("#" + fieldId + "_label").val(data.label_value);
        $("#" + fieldId).data("lov", data.data);
        $("#" + fieldId).trigger("change");
    });
}

function setLookupLabelValue(fieldId, labelValue) {
    var url = $("#" + fieldId).attr("href");
    url = url.replace("lov?", "lov_value?")
    url = url + "&lklblval=" + labelValue;
    $.getJSON(url, function (data) {
        $("#" + fieldId).val(data.value);
        $("#" + fieldId + "_label").val(data.label_value);
        $("#" + fieldId).data("lov", data.data);
        $("#" + fieldId).trigger("change");
    });
}

//END========================LOOKUP lov 帮助函数========================================

//BEGIN========================datepicker 帮助函数========================================
function initDateField(dateField) {
    var me = $(dateField);
    me.datepicker({format:"yyyy-mm-dd", weekStart:1});
    me.attr("onfocus", "");
    me.trigger("focus");
}
function dateFieldChooseToday(fieldId, fieldValue) {
    $("#" + fieldId).val(fieldValue);
    $("#" + fieldId).trigger("keyup");
}
//END========================datepicker 帮助函数========================================

//BEGIN========================colorpicker 帮助函数========================================
function initColorField(colorField) {
    var me = $(colorField);
    me.css("background-color", me.val());
    me.css("color", getContrastYIQ(me.val().replace("#", "")));
    me.colorpicker({format:'hex'}).on('changeColor', function (ev) {
        me.css("background-color", ev.color.toHex());
        me.val(ev.color.toHex());
        me.css("color", getContrastYIQ(ev.color.toHex().replace("#", "")));
    });
    ;

    me.attr("onfocus", "");
    me.trigger("focus");
}

function getContrastYIQ(hexcolor) {
    var r = parseInt(hexcolor.substr(0, 2), 16);
    var g = parseInt(hexcolor.substr(2, 2), 16);
    var b = parseInt(hexcolor.substr(4, 2), 16);
    var yiq = ((r * 299) + (g * 587) + (b * 114)) / 1000;
    return (yiq >= 128) ? 'black' : 'white';
}
//END========================colorpicker 帮助函数========================================

//START =================================Ajax 监听帮助函数================================
function get_dom_id(ajaxOptions) {

    var url = ajaxOptions.url || "", data = ajaxOptions.data || "";
    if (url.indexOf("?") > -1) {
        url = url.substring(url.indexOf("?") + 1, url.length);
    }
    else {
        url = ""
    }
    data = data.substring(data.indexOf("?") + 1, data.length);
    return $.extend({}, $.deserialize(data), $.deserialize(url))["_dom_id"]
}
//end =================================Ajax 监听帮助函数================================


//START =================================Chosen 渲染select==========w======================
function checkSelect() {
    $("select:not([multiple])").each(function (index, element) {
        //如果当前select的options超过chosenMiniNum项或者chosen=true属性对其进行渲染
        if (($(element).find("option").length > chosenMiniNum && $(element).attr("chosen") != 'false') || $(element).attr("chosen") == 'true') {
            if ($(element).attr('depend')) return false;
            if (typeof $(element).attr("chosen") == 'undefined') $(element).attr("chosen", true);
            $(element).css('width', getSelectWidth($(element)));
            $(element).chosen({search_contains:true, disable_search_threshold:searchMiniNum});
        }
    });
}
//获取select宽度
function getSelectWidth(selectObj) {
    if (!selectObj) return 0;
    var width = selectObj.width();
    //当select的父级元素不可见时
    if (width == 0) {
        var cloneObj = selectObj.clone();
        cloneObj.css({visibility:"hidden"});
        $('body').append(cloneObj);
        width = cloneObj.width();
        cloneObj.remove();
    }
    //设置默认宽度当宽度小于100
    if (width < 100) {
        width = 100
    }
    //检查元素是否设置了最大宽度
    if (selectObj.attr("max-width")) {
        var maxWidth = parseInt(selectObj.attr("max-width").replace(/[^0-9]/ig, ""));
        if (width > maxWidth) {
            width = maxWidth
        }
    }
    width = (width + 18) + "px";
    return width;
}
//end =================================Chosen 渲染select================================
//START =================================客户端校验文件大小================================
function checkAttachment(target, limitSize) {
    var fileSize = 0;
    if ($.browser.msie && !target.files) {
        var file_system = new ActiveXObject("Scripting.FileSystemObject");
        var file = file_system.GetFile($(target).val());
        fileSize = file.Size;
    } else {
        fileSize = target.files[0].size;
    }
    if (fileSize > limitSize) {
        var alertModal = $("#alertModal");
        if (alertModal.length < 1) {
            alertModal = $("<div>", {"id":"alertModal", "class":"modal hide fade", "style":"display: none; "});
            alertModal.append($("<div>", {"class":"modal-header"}).html("<button type='button' class='close' data-dismiss='modal'>&times;</button><h3>附件出错了</h3>"));
            alertModal.append($("<div>", {"class":"modal-body"}).html("<p>附件内容太大，请从新选择附件！</p>"));
            alertModal.append($("<div>", {"class":"modal-footer"}).html("<a href='#' data-dismiss='modal' class='btn btn-primary'>确定</a>"));
            $("body").append(alertModal);
        }
        alertModal.modal({show:true});
        $(target).val("");
    }
}
//end =================================客户端校验文件大小=================================

//START =================================返回顶部================================
var scrollToTop = scrollToTop || {
    setup:function () {
        var height = $(window).height() / 2;
        $(window).scroll(function () {
            (window.innerWidth ? window.pageYOffset : document.documentElement.scrollTop) >= height ? $("#scrollToTop").css("visibility", "visible") : $("#scrollToTop").css("visibility", "hidden");
        });
        $("#scrollToTop").click(function () {
            $("html, body").animate({
                scrollTop:"0px"
            }, 400);
            return false
        })
    }
};
//END =================================返回顶部================================
function showFadeBackMessage(id, message) {
    var html = "";
    html += "<div class='alert'>";
    html += "<button type='button' class='close' data-dismiss='alert'>×</button>";
    for (var i in message) {
        html += message[i];
        html += "<br/>";
    }
    html += "</div>";
    $("#" + id).html(html);
}