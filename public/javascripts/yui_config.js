var yuiConfig = {
    base:      '/javascripts/yui3.3/',
    //comboBase: '/combo?',
    //root :'/javascripts/yui3.3/',
    //combine: true,
    modules:{
        irm:{
            fullpath:"/javascripts/irm/core.js",
            requires: ['base',"overlay","node-event-simulate","event-custom","event-mouseenter"]
        },
        dtdatasource:{
            fullpath:"/javascripts/irm/datatable/dtdatasource.js",
            requires: ["datatable-datasource"]
        },
        dtcolwidth:{
            fullpath:"/javascripts/irm/datatable/dtcolwidth.js",
            requires: ["datatable"]
        },
        dtsort:{
            fullpath:"/javascripts/irm/datatable/dtsort.js",
            requires: ['datatable']
        },
        dtsearchbox:{
            fullpath:"/javascripts/irm/datatable/dtselector.js",
            requires: []
        },
        dtpaginator:{
            fullpath:"/javascripts/irm/datatable/dtpaginator.js",
            requires: []
        },
        dtselector:{
            fullpath:"/javascripts/irm/datatable/dtsearchbox.js",
            requires: []
        },
        gallerywidgetio:{
            fullpath:"/javascripts/gallery/widget-io.js",
            requires: ["io-base"]
        },
        gallerydispatcher:{
            fullpath:"/javascripts/gallery/gallery-dispatcher.js",
            requires: ['base', 'node-base', 'io-base', 'get', 'async-queue', 'classnamemanager']
        },        
        dialog:{
            fullpath:"/javascripts/irm/dialog/dialog-base.js",
            requires: ["'widget', 'widget-stdmod', 'widget-position', 'widget-stack', 'widget-position-align', 'widget-position-constrain'"],
            "skinnable": true
        },
        cascadeselect:{
            fullpath:"/javascripts/irm/cascadeselect.js",
            requires: ["io-base","substitute","json-parse"]
        },
        duelselect:{
            fullpath:"/javascripts/irm/duelselect.js",
            requires: []
        },
        menubutton:{
            fullpath:"/javascripts/irm/menubutton.js",
            requires: ["base","node-base","overlay"]
        },
        irmac:{
            fullpath:"/javascripts/irm/autocomplete/autocomplete-base.js",
            requires:['autocomplete-list', 'node-pluginhost','substitute']
        },
        calendarlocalizationzh:{
            fullpath:"/javascripts/yui_calendar_localization/zh.js",
            requires:[]
        },
        calendarlocalizationen:{
            fullpath:"/javascripts/yui_calendar_localization/en.js",
            requires:[]
        },
        calendarlocalizationjp:{
            fullpath:"/javascripts/yui_calendar_localization/jp.js",
            requires:[]
        }
    },
    groups: {
            yui2: {
                base:      '/javascripts/yui2.8.1/',
                //comboBase: '/combo?',
                //root :'/javascripts/yui2.8.1/',
                //combine: true,
                patterns:  {
                    'yui2-': {
                        configFn: function(me) {
                            if(/-skin|reset|fonts|grids|base/.test(me.name)) {
                                me.type = 'css';
                                me.path = me.path.replace(/\.js/, '.css');
                                // this makes skins in builds earlier than 2.6.0 work as long as combine is false
                                me.path = me.path.replace(/\/yui2-skin/, '/assets/skins/sam/yui2-skin');
                            }
                        }
                    }
                }
            }
         }
};
var GY = YUI(yuiConfig).use("base");