/**
 * editor_plugin_src.js
 *
 * Copyright 2009, Moxiecode Systems AB
 * Released under LGPL License.
 *
 * License: http://tinymce.moxiecode.com/license
 * Contributing: http://tinymce.moxiecode.com/contributing
 */
(function(){tinymce.create("tinymce.plugins.Directionality",{init:function(e,t){function r(t){var n=e.dom,r,i=e.selection.getSelectedBlocks();i.length&&(r=n.getAttrib(i[0],"dir"),tinymce.each(i,function(e){n.getParent(e.parentNode,"*[dir='"+t+"']",n.getRoot())||(r!=t?n.setAttrib(e,"dir",t):n.setAttrib(e,"dir",null))}),e.nodeChanged())}var n=this;n.editor=e,e.addCommand("mceDirectionLTR",function(){r("ltr")}),e.addCommand("mceDirectionRTL",function(){r("rtl")}),e.addButton("ltr",{title:"directionality.ltr_desc",cmd:"mceDirectionLTR"}),e.addButton("rtl",{title:"directionality.rtl_desc",cmd:"mceDirectionRTL"}),e.onNodeChange.add(n._nodeChange,n)},getInfo:function(){return{longname:"Directionality",author:"Moxiecode Systems AB",authorurl:"http://tinymce.moxiecode.com",infourl:"http://wiki.moxiecode.com/index.php/TinyMCE:Plugins/directionality",version:tinymce.majorVersion+"."+tinymce.minorVersion}},_nodeChange:function(e,t,n){var r=e.dom,i;n=r.getParent(n,r.isBlock);if(!n){t.setDisabled("ltr",1),t.setDisabled("rtl",1);return}i=r.getAttrib(n,"dir"),t.setActive("ltr",i=="ltr"),t.setDisabled("ltr",0),t.setActive("rtl",i=="rtl"),t.setDisabled("rtl",0)}}),tinymce.PluginManager.add("directionality",tinymce.plugins.Directionality)})();