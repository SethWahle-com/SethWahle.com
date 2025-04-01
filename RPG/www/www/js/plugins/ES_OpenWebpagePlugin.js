//=============================================================================
// ES_OpenWebpagePlugin.js
//=============================================================================

/*:
 * @plugindesc v1.0 Plugin to open one or multiple external web pages from the game.
 * 
 * @author EroiK StyLeR
 *
 * @param URL1
 * @desc The URL of the webpage for the command OpenWebpage1.
 * @default https://www.google.fr
 *
 * @param URL2
 * @desc The URL of the webpage for the command OpenWebpage2.
 * @default https://www.google.fr
 *
 * @param URL3
 * @desc The URL of the webpage for the command OpenWebpage3.
 * @default https://www.google.fr
 *
 * @param URL4
 * @desc The URL of the webpage for the command OpenWebpage4.
 * @default https://www.google.fr
 *
 * @param URL5
 * @desc The URL of the webpage for the command OpenWebpage5.
 * @default https://www.google.fr
 *
 * @param URL6
 * @desc The URL of the webpage for the command OpenWebpage6.
 * @default https://www.google.fr
 *
 * @param URL7
 * @desc The URL of the webpage for the command OpenWebpage7.
 * @default https://www.google.fr
 *
 * @param URL8
 * @desc The URL of the webpage for the command OpenWebpage8.
 * @default https://www.google.fr
 *
 * @param URL9
 * @desc The URL of the webpage for the command OpenWebpage9.
 * @default https://www.google.fr
 *
 * @param URL10
 * @desc The URL of the webpage for the command OpenWebpage10.
 * @default https://www.google.fr
 *
 *
 * @help 
 * Plugin Usage:
 *
 * To open the external webpage within the game, 
 * use the following plugin commands. 
 * In an event, open the Module Command and paste the text OpenWebpage1.
 *
 * Example:
 *   
 * Module Command: OpenWebpage1          This will open page 1
 * Module Command: OpenWebpage2          This will open page 2
 * Module Command: OpenWebpage3          This will open page 3
 * 
 * OpenWebpage1
 * OpenWebpage2
 * OpenWebpage3
 * OpenWebpage4
 * OpenWebpage5
 * OpenWebpage6
 * OpenWebpage7
 * OpenWebpage8
 * OpenWebpage9
 * OpenWebpage10
 *
 * Version: v1.0
 *
 */

var _0x51cf33=_0x6080;function _0x1f08(){var _0x4206e8=['URL5','URL3','OpenWebpage2','248168CUbTUy','call','URL10','1472350HSXqMY','OpenWebpage1','378gKrQFK','OpenWebpage9','URL6','3432nvQXOe','prototype','nw.gui','pluginCommand','OpenWebpage5','1646664cBqErO','5036805kHAqOw','URL4','351825JUfmMj','URL9','ES_OpenWebpagePlugin','URL1','OpenWebpage4','open','isNwjs','_blank','OpenWebpage10','OpenWebpage7','4981cMJNLJ','OpenWebpage3','2DCQqdv'];_0x1f08=function(){return _0x4206e8;};return _0x1f08();}(function(_0x44cd53,_0xb355d3){var _0x229c37=_0x6080,_0x2d5b2e=_0x44cd53();while(!![]){try{var _0x4acca5=parseInt(_0x229c37(0x1c6))/0x1*(-parseInt(_0x229c37(0x1c8))/0x2)+parseInt(_0x229c37(0x1bc))/0x3+parseInt(_0x229c37(0x1ac))/0x4+parseInt(_0x229c37(0x1af))/0x5+parseInt(_0x229c37(0x1b9))/0x6+-parseInt(_0x229c37(0x1b1))/0x7*(-parseInt(_0x229c37(0x1b4))/0x8)+-parseInt(_0x229c37(0x1ba))/0x9;if(_0x4acca5===_0xb355d3)break;else _0x2d5b2e['push'](_0x2d5b2e['shift']());}catch(_0x5cde3f){_0x2d5b2e['push'](_0x2d5b2e['shift']());}}}(_0x1f08,0x327b3));function _0x6080(_0x3ad827,_0x2a34b3){var _0x1f0839=_0x1f08();return _0x6080=function(_0x608086,_0x2375ed){_0x608086=_0x608086-0x1ac;var _0x5bb2e1=_0x1f0839[_0x608086];return _0x5bb2e1;},_0x6080(_0x3ad827,_0x2a34b3);}var Imported=Imported||{};Imported[_0x51cf33(0x1be)]=!![],(function(){var _0x5a7d22=_0x51cf33,_0x8195fa=PluginManager['parameters'](_0x5a7d22(0x1be)),_0x303e2a=String(_0x8195fa[_0x5a7d22(0x1bf)]),_0x1f04ed=String(_0x8195fa['URL2']),_0x51da96=String(_0x8195fa[_0x5a7d22(0x1ca)]),_0x4238b6=String(_0x8195fa[_0x5a7d22(0x1bb)]),_0x34684c=String(_0x8195fa[_0x5a7d22(0x1c9)]),_0x4d18ad=String(_0x8195fa[_0x5a7d22(0x1b3)]),_0xd8d084=String(_0x8195fa['URL7']),_0x1737d8=String(_0x8195fa['URL8']),_0x1861b0=String(_0x8195fa[_0x5a7d22(0x1bd)]),_0x1ecc34=String(_0x8195fa[_0x5a7d22(0x1ae)]),_0x588c29=function(_0x446d36){var _0x4f1ff5=_0x5a7d22;if(Utils[_0x4f1ff5(0x1c2)]()){var _0x228a26=require(_0x4f1ff5(0x1b6));_0x228a26['Shell']['openExternal'](_0x446d36);}else window[_0x4f1ff5(0x1c1)](_0x446d36,_0x4f1ff5(0x1c3));},_0x466917=Game_Interpreter[_0x5a7d22(0x1b5)][_0x5a7d22(0x1b7)];Game_Interpreter[_0x5a7d22(0x1b5)][_0x5a7d22(0x1b7)]=function(_0x100995,_0x4d5e5e){var _0x500bcb=_0x5a7d22;_0x466917[_0x500bcb(0x1ad)](this,_0x100995,_0x4d5e5e);if(_0x100995===_0x500bcb(0x1b0))_0x588c29(_0x303e2a);else{if(_0x100995===_0x500bcb(0x1cb))_0x588c29(_0x1f04ed);else{if(_0x100995===_0x500bcb(0x1c7))_0x588c29(_0x51da96);else{if(_0x100995===_0x500bcb(0x1c0))_0x588c29(_0x4238b6);else{if(_0x100995===_0x500bcb(0x1b8))_0x588c29(_0x34684c);else{if(_0x100995==='OpenWebpage6')_0x588c29(_0x4d18ad);else{if(_0x100995===_0x500bcb(0x1c5))_0x588c29(_0xd8d084);else{if(_0x100995==='OpenWebpage8')_0x588c29(_0x1737d8);else{if(_0x100995===_0x500bcb(0x1b2))_0x588c29(_0x1861b0);else _0x100995===_0x500bcb(0x1c4)&&_0x588c29(_0x1ecc34);}}}}}}}}};}());