/**
 * editor_plugin_src.js
 *
 * Copyright 2012, Moxiecode Systems AB
 * Released under LGPL License.
 *
 * License: http://tinymce.moxiecode.com/license
 * Contributing: http://tinymce.moxiecode.com/contributing
 */
(function(){tinymce.create("tinymce.plugins.VisualBlocks",{init:function(e,t){var n;if(!window.NodeList)return;e.addCommand("mceVisualBlocks",function(){var r=e.dom,i;n?(i=r.get(n),i.disabled=!i.disabled):(n=r.uniqueId(),i=r.create("link",{id:n,rel:"stylesheet",href:t+"/css/visualblocks.css"}),e.getDoc().getElementsByTagName("head")[0].appendChild(i)),e.controlManager.setActive("visualblocks",!i.disabled)}),e.addButton("visualblocks",{title:"visualblocks.desc",cmd:"mceVisualBlocks"}),e.onInit.add(function(){e.settings.visualblocks_default_state&&e.execCommand("mceVisualBlocks",!1,null,{skip_focus:!0})})},getInfo:function(){return{longname:"Visual blocks",author:"Moxiecode Systems AB",authorurl:"http://tinymce.moxiecode.com",infourl:"http://wiki.moxiecode.com/index.php/TinyMCE:Plugins/visualblocks",version:tinymce.majorVersion+"."+tinymce.minorVersion}}}),tinymce.PluginManager.add("visualblocks",tinymce.plugins.VisualBlocks)})();