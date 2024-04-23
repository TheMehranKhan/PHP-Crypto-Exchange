(function webpackUniversalModuleDefinition(root, factory) {
	if(typeof exports === 'object' && typeof module === 'object')
		module.exports = factory(require("vue"));
	else if(typeof define === 'function' && define.amd)
		define(["vue"], factory);
	else if(typeof exports === 'object')
		exports["vue-slider-component"] = factory(require("vue"));
	else
		root["vue-slider-component"] = factory(root["Vue"]);
})((typeof self !== 'undefined' ? self : this), function(__WEBPACK_EXTERNAL_MODULE__927__) {
return /******/ (function() { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ 388:
/***/ (function(module, exports) {

var __WEBPACK_AMD_DEFINE_FACTORY__, __WEBPACK_AMD_DEFINE_ARRAY__, __WEBPACK_AMD_DEFINE_RESULT__;// addapted from the document.currentScript polyfill by Adam Miller
// MIT license
// source: https://github.com/amiller-gh/currentScript-polyfill

// added support for Firefox https://bugzilla.mozilla.org/show_bug.cgi?id=1620505

(function (root, factory) {
  if (true) {
    !(__WEBPACK_AMD_DEFINE_ARRAY__ = [], __WEBPACK_AMD_DEFINE_FACTORY__ = (factory),
		__WEBPACK_AMD_DEFINE_RESULT__ = (typeof __WEBPACK_AMD_DEFINE_FACTORY__ === 'function' ?
		(__WEBPACK_AMD_DEFINE_FACTORY__.apply(exports, __WEBPACK_AMD_DEFINE_ARRAY__)) : __WEBPACK_AMD_DEFINE_FACTORY__),
		__WEBPACK_AMD_DEFINE_RESULT__ !== undefined && (module.exports = __WEBPACK_AMD_DEFINE_RESULT__));
  } else {}
}(typeof self !== 'undefined' ? self : this, function () {
  function getCurrentScript () {
    var descriptor = Object.getOwnPropertyDescriptor(document, 'currentScript')
    // for chrome
    if (!descriptor && 'currentScript' in document && document.currentScript) {
      return document.currentScript
    }

    // for other browsers with native support for currentScript
    if (descriptor && descriptor.get !== getCurrentScript && document.currentScript) {
      return document.currentScript
    }
  
    // IE 8-10 support script readyState
    // IE 11+ & Firefox support stack trace
    try {
      throw new Error();
    }
    catch (err) {
      // Find the second match for the "at" string to get file src url from stack.
      var ieStackRegExp = /.*at [^(]*\((.*):(.+):(.+)\)$/ig,
        ffStackRegExp = /@([^@]*):(\d+):(\d+)\s*$/ig,
        stackDetails = ieStackRegExp.exec(err.stack) || ffStackRegExp.exec(err.stack),
        scriptLocation = (stackDetails && stackDetails[1]) || false,
        line = (stackDetails && stackDetails[2]) || false,
        currentLocation = document.location.href.replace(document.location.hash, ''),
        pageSource,
        inlineScriptSourceRegExp,
        inlineScriptSource,
        scripts = document.getElementsByTagName('script'); // Live NodeList collection
  
      if (scriptLocation === currentLocation) {
        pageSource = document.documentElement.outerHTML;
        inlineScriptSourceRegExp = new RegExp('(?:[^\\n]+?\\n){0,' + (line - 2) + '}[^<]*<script>([\\d\\D]*?)<\\/script>[\\d\\D]*', 'i');
        inlineScriptSource = pageSource.replace(inlineScriptSourceRegExp, '$1').trim();
      }
  
      for (var i = 0; i < scripts.length; i++) {
        // If ready state is interactive, return the script tag
        if (scripts[i].readyState === 'interactive') {
          return scripts[i];
        }
  
        // If src matches, return the script tag
        if (scripts[i].src === scriptLocation) {
          return scripts[i];
        }
  
        // If inline source matches, return the script tag
        if (
          scriptLocation === currentLocation &&
          scripts[i].innerHTML &&
          scripts[i].innerHTML.trim() === inlineScriptSource
        ) {
          return scripts[i];
        }
      }
  
      // If no match, return null
      return null;
    }
  };

  return getCurrentScript
}));


/***/ }),

/***/ 325:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_pnpm_css_loader_6_7_1_webpack_5_72_0_node_modules_css_loader_dist_runtime_noSourceMaps_js__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(117);
/* harmony import */ var _node_modules_pnpm_css_loader_6_7_1_webpack_5_72_0_node_modules_css_loader_dist_runtime_noSourceMaps_js__WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(_node_modules_pnpm_css_loader_6_7_1_webpack_5_72_0_node_modules_css_loader_dist_runtime_noSourceMaps_js__WEBPACK_IMPORTED_MODULE_0__);
/* harmony import */ var _node_modules_pnpm_css_loader_6_7_1_webpack_5_72_0_node_modules_css_loader_dist_runtime_api_js__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(488);
/* harmony import */ var _node_modules_pnpm_css_loader_6_7_1_webpack_5_72_0_node_modules_css_loader_dist_runtime_api_js__WEBPACK_IMPORTED_MODULE_1___default = /*#__PURE__*/__webpack_require__.n(_node_modules_pnpm_css_loader_6_7_1_webpack_5_72_0_node_modules_css_loader_dist_runtime_api_js__WEBPACK_IMPORTED_MODULE_1__);
// Imports


var ___CSS_LOADER_EXPORT___ = _node_modules_pnpm_css_loader_6_7_1_webpack_5_72_0_node_modules_css_loader_dist_runtime_api_js__WEBPACK_IMPORTED_MODULE_1___default()((_node_modules_pnpm_css_loader_6_7_1_webpack_5_72_0_node_modules_css_loader_dist_runtime_noSourceMaps_js__WEBPACK_IMPORTED_MODULE_0___default()));
// Module
___CSS_LOADER_EXPORT___.push([module.id, ".vue-slider-dot{position:absolute;-webkit-transition:all 0s;transition:all 0s;z-index:5}.vue-slider-dot:focus{outline:none}.vue-slider-dot-tooltip{position:absolute;visibility:hidden}.vue-slider-dot-hover:hover .vue-slider-dot-tooltip,.vue-slider-dot-tooltip-show{visibility:visible}.vue-slider-dot-tooltip-top{top:-10px;left:50%;-webkit-transform:translate(-50%,-100%);transform:translate(-50%,-100%)}.vue-slider-dot-tooltip-bottom{bottom:-10px;left:50%;-webkit-transform:translate(-50%,100%);transform:translate(-50%,100%)}.vue-slider-dot-tooltip-left{left:-10px;top:50%;-webkit-transform:translate(-100%,-50%);transform:translate(-100%,-50%)}.vue-slider-dot-tooltip-right{right:-10px;top:50%;-webkit-transform:translate(100%,-50%);transform:translate(100%,-50%)}", ""]);
// Exports
/* harmony default export */ __webpack_exports__["default"] = (___CSS_LOADER_EXPORT___);


/***/ }),

/***/ 170:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_pnpm_css_loader_6_7_1_webpack_5_72_0_node_modules_css_loader_dist_runtime_noSourceMaps_js__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(117);
/* harmony import */ var _node_modules_pnpm_css_loader_6_7_1_webpack_5_72_0_node_modules_css_loader_dist_runtime_noSourceMaps_js__WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(_node_modules_pnpm_css_loader_6_7_1_webpack_5_72_0_node_modules_css_loader_dist_runtime_noSourceMaps_js__WEBPACK_IMPORTED_MODULE_0__);
/* harmony import */ var _node_modules_pnpm_css_loader_6_7_1_webpack_5_72_0_node_modules_css_loader_dist_runtime_api_js__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(488);
/* harmony import */ var _node_modules_pnpm_css_loader_6_7_1_webpack_5_72_0_node_modules_css_loader_dist_runtime_api_js__WEBPACK_IMPORTED_MODULE_1___default = /*#__PURE__*/__webpack_require__.n(_node_modules_pnpm_css_loader_6_7_1_webpack_5_72_0_node_modules_css_loader_dist_runtime_api_js__WEBPACK_IMPORTED_MODULE_1__);
// Imports


var ___CSS_LOADER_EXPORT___ = _node_modules_pnpm_css_loader_6_7_1_webpack_5_72_0_node_modules_css_loader_dist_runtime_api_js__WEBPACK_IMPORTED_MODULE_1___default()((_node_modules_pnpm_css_loader_6_7_1_webpack_5_72_0_node_modules_css_loader_dist_runtime_noSourceMaps_js__WEBPACK_IMPORTED_MODULE_0___default()));
// Module
___CSS_LOADER_EXPORT___.push([module.id, ".vue-slider-marks{position:relative;width:100%;height:100%}.vue-slider-mark{position:absolute;z-index:1}.vue-slider-ltr .vue-slider-mark,.vue-slider-rtl .vue-slider-mark{width:0;height:100%;top:50%}.vue-slider-ltr .vue-slider-mark-step,.vue-slider-rtl .vue-slider-mark-step{top:0}.vue-slider-ltr .vue-slider-mark-label,.vue-slider-rtl .vue-slider-mark-label{top:100%;margin-top:10px}.vue-slider-ltr .vue-slider-mark{-webkit-transform:translate(-50%,-50%);transform:translate(-50%,-50%)}.vue-slider-ltr .vue-slider-mark-step{left:0}.vue-slider-ltr .vue-slider-mark-label{left:50%;-webkit-transform:translateX(-50%);transform:translateX(-50%)}.vue-slider-rtl .vue-slider-mark{-webkit-transform:translate(50%,-50%);transform:translate(50%,-50%)}.vue-slider-rtl .vue-slider-mark-step{right:0}.vue-slider-rtl .vue-slider-mark-label{right:50%;-webkit-transform:translateX(50%);transform:translateX(50%)}.vue-slider-btt .vue-slider-mark,.vue-slider-ttb .vue-slider-mark{width:100%;height:0;left:50%}.vue-slider-btt .vue-slider-mark-step,.vue-slider-ttb .vue-slider-mark-step{left:0}.vue-slider-btt .vue-slider-mark-label,.vue-slider-ttb .vue-slider-mark-label{left:100%;margin-left:10px}.vue-slider-btt .vue-slider-mark{-webkit-transform:translate(-50%,50%);transform:translate(-50%,50%)}.vue-slider-btt .vue-slider-mark-step{top:0}.vue-slider-btt .vue-slider-mark-label{top:50%;-webkit-transform:translateY(-50%);transform:translateY(-50%)}.vue-slider-ttb .vue-slider-mark{-webkit-transform:translate(-50%,-50%);transform:translate(-50%,-50%)}.vue-slider-ttb .vue-slider-mark-step{bottom:0}.vue-slider-ttb .vue-slider-mark-label{bottom:50%;-webkit-transform:translateY(50%);transform:translateY(50%)}.vue-slider-mark-label,.vue-slider-mark-step{position:absolute}", ""]);
// Exports
/* harmony default export */ __webpack_exports__["default"] = (___CSS_LOADER_EXPORT___);


/***/ }),

/***/ 721:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_pnpm_css_loader_6_7_1_webpack_5_72_0_node_modules_css_loader_dist_runtime_noSourceMaps_js__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(117);
/* harmony import */ var _node_modules_pnpm_css_loader_6_7_1_webpack_5_72_0_node_modules_css_loader_dist_runtime_noSourceMaps_js__WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(_node_modules_pnpm_css_loader_6_7_1_webpack_5_72_0_node_modules_css_loader_dist_runtime_noSourceMaps_js__WEBPACK_IMPORTED_MODULE_0__);
/* harmony import */ var _node_modules_pnpm_css_loader_6_7_1_webpack_5_72_0_node_modules_css_loader_dist_runtime_api_js__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(488);
/* harmony import */ var _node_modules_pnpm_css_loader_6_7_1_webpack_5_72_0_node_modules_css_loader_dist_runtime_api_js__WEBPACK_IMPORTED_MODULE_1___default = /*#__PURE__*/__webpack_require__.n(_node_modules_pnpm_css_loader_6_7_1_webpack_5_72_0_node_modules_css_loader_dist_runtime_api_js__WEBPACK_IMPORTED_MODULE_1__);
// Imports


var ___CSS_LOADER_EXPORT___ = _node_modules_pnpm_css_loader_6_7_1_webpack_5_72_0_node_modules_css_loader_dist_runtime_api_js__WEBPACK_IMPORTED_MODULE_1___default()((_node_modules_pnpm_css_loader_6_7_1_webpack_5_72_0_node_modules_css_loader_dist_runtime_noSourceMaps_js__WEBPACK_IMPORTED_MODULE_0___default()));
// Module
___CSS_LOADER_EXPORT___.push([module.id, ".vue-slider{position:relative;-webkit-box-sizing:content-box;box-sizing:content-box;-webkit-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none;display:block;-webkit-tap-highlight-color:rgba(0,0,0,0)}.vue-slider-rail{position:relative;width:100%;height:100%;-webkit-transition-property:width,height,left,right,top,bottom;transition-property:width,height,left,right,top,bottom}.vue-slider-process{position:absolute;z-index:1}", ""]);
// Exports
/* harmony default export */ __webpack_exports__["default"] = (___CSS_LOADER_EXPORT___);


/***/ }),

/***/ 488:
/***/ (function(module) {

"use strict";


/*
  MIT License http://www.opensource.org/licenses/mit-license.php
  Author Tobias Koppers @sokra
*/
module.exports = function (cssWithMappingToString) {
  var list = []; // return the list of modules as css string

  list.toString = function toString() {
    return this.map(function (item) {
      var content = "";
      var needLayer = typeof item[5] !== "undefined";

      if (item[4]) {
        content += "@supports (".concat(item[4], ") {");
      }

      if (item[2]) {
        content += "@media ".concat(item[2], " {");
      }

      if (needLayer) {
        content += "@layer".concat(item[5].length > 0 ? " ".concat(item[5]) : "", " {");
      }

      content += cssWithMappingToString(item);

      if (needLayer) {
        content += "}";
      }

      if (item[2]) {
        content += "}";
      }

      if (item[4]) {
        content += "}";
      }

      return content;
    }).join("");
  }; // import a list of modules into the list


  list.i = function i(modules, media, dedupe, supports, layer) {
    if (typeof modules === "string") {
      modules = [[null, modules, undefined]];
    }

    var alreadyImportedModules = {};

    if (dedupe) {
      for (var k = 0; k < this.length; k++) {
        var id = this[k][0];

        if (id != null) {
          alreadyImportedModules[id] = true;
        }
      }
    }

    for (var _k = 0; _k < modules.length; _k++) {
      var item = [].concat(modules[_k]);

      if (dedupe && alreadyImportedModules[item[0]]) {
        continue;
      }

      if (typeof layer !== "undefined") {
        if (typeof item[5] === "undefined") {
          item[5] = layer;
        } else {
          item[1] = "@layer".concat(item[5].length > 0 ? " ".concat(item[5]) : "", " {").concat(item[1], "}");
          item[5] = layer;
        }
      }

      if (media) {
        if (!item[2]) {
          item[2] = media;
        } else {
          item[1] = "@media ".concat(item[2], " {").concat(item[1], "}");
          item[2] = media;
        }
      }

      if (supports) {
        if (!item[4]) {
          item[4] = "".concat(supports);
        } else {
          item[1] = "@supports (".concat(item[4], ") {").concat(item[1], "}");
          item[4] = supports;
        }
      }

      list.push(item);
    }
  };

  return list;
};

/***/ }),

/***/ 117:
/***/ (function(module) {

"use strict";


module.exports = function (i) {
  return i[1];
};

/***/ }),

/***/ 831:
/***/ (function(__unused_webpack_module, exports) {

"use strict";
var __webpack_unused_export__;

__webpack_unused_export__ = ({ value: true });
// runtime helper for setting properties on components
// in a tree-shakable way
exports.Z = (sfc, props) => {
    const target = sfc.__vccOpts || sfc;
    for (const [key, val] of props) {
        target[key] = val;
    }
    return target;
};


/***/ }),

/***/ 259:
/***/ (function(module, __unused_webpack_exports, __webpack_require__) {

// style-loader: Adds some css to the DOM by adding a <style> tag

// load the styles
var content = __webpack_require__(325);
if(content.__esModule) content = content.default;
if(typeof content === 'string') content = [[module.id, content, '']];
if(content.locals) module.exports = content.locals;
// add the styles to the DOM
var add = (__webpack_require__(959)/* ["default"] */ .Z)
var update = add("e5002a90", content, true, {"sourceMap":false,"shadowMode":false});

/***/ }),

/***/ 714:
/***/ (function(module, __unused_webpack_exports, __webpack_require__) {

// style-loader: Adds some css to the DOM by adding a <style> tag

// load the styles
var content = __webpack_require__(170);
if(content.__esModule) content = content.default;
if(typeof content === 'string') content = [[module.id, content, '']];
if(content.locals) module.exports = content.locals;
// add the styles to the DOM
var add = (__webpack_require__(959)/* ["default"] */ .Z)
var update = add("2bc7acce", content, true, {"sourceMap":false,"shadowMode":false});

/***/ }),

/***/ 85:
/***/ (function(module, __unused_webpack_exports, __webpack_require__) {

// style-loader: Adds some css to the DOM by adding a <style> tag

// load the styles
var content = __webpack_require__(721);
if(content.__esModule) content = content.default;
if(typeof content === 'string') content = [[module.id, content, '']];
if(content.locals) module.exports = content.locals;
// add the styles to the DOM
var add = (__webpack_require__(959)/* ["default"] */ .Z)
var update = add("bd015634", content, true, {"sourceMap":false,"shadowMode":false});

/***/ }),

/***/ 959:
/***/ (function(__unused_webpack_module, __webpack_exports__, __webpack_require__) {

"use strict";

// EXPORTS
__webpack_require__.d(__webpack_exports__, {
  "Z": function() { return /* binding */ addStylesClient; }
});

;// CONCATENATED MODULE: ./node_modules/.pnpm/vue-style-loader@4.1.3/node_modules/vue-style-loader/lib/listToStyles.js
/**
 * Translates the list format produced by css-loader into something
 * easier to manipulate.
 */
function listToStyles (parentId, list) {
  var styles = []
  var newStyles = {}
  for (var i = 0; i < list.length; i++) {
    var item = list[i]
    var id = item[0]
    var css = item[1]
    var media = item[2]
    var sourceMap = item[3]
    var part = {
      id: parentId + ':' + i,
      css: css,
      media: media,
      sourceMap: sourceMap
    }
    if (!newStyles[id]) {
      styles.push(newStyles[id] = { id: id, parts: [part] })
    } else {
      newStyles[id].parts.push(part)
    }
  }
  return styles
}

;// CONCATENATED MODULE: ./node_modules/.pnpm/vue-style-loader@4.1.3/node_modules/vue-style-loader/lib/addStylesClient.js
/*
  MIT License http://www.opensource.org/licenses/mit-license.php
  Author Tobias Koppers @sokra
  Modified by Evan You @yyx990803
*/



var hasDocument = typeof document !== 'undefined'

if (typeof DEBUG !== 'undefined' && DEBUG) {
  if (!hasDocument) {
    throw new Error(
    'vue-style-loader cannot be used in a non-browser environment. ' +
    "Use { target: 'node' } in your Webpack config to indicate a server-rendering environment."
  ) }
}

/*
type StyleObject = {
  id: number;
  parts: Array<StyleObjectPart>
}

type StyleObjectPart = {
  css: string;
  media: string;
  sourceMap: ?string
}
*/

var stylesInDom = {/*
  [id: number]: {
    id: number,
    refs: number,
    parts: Array<(obj?: StyleObjectPart) => void>
  }
*/}

var head = hasDocument && (document.head || document.getElementsByTagName('head')[0])
var singletonElement = null
var singletonCounter = 0
var isProduction = false
var noop = function () {}
var options = null
var ssrIdKey = 'data-vue-ssr-id'

// Force single-tag solution on IE6-9, which has a hard limit on the # of <style>
// tags it will allow on a page
var isOldIE = typeof navigator !== 'undefined' && /msie [6-9]\b/.test(navigator.userAgent.toLowerCase())

function addStylesClient (parentId, list, _isProduction, _options) {
  isProduction = _isProduction

  options = _options || {}

  var styles = listToStyles(parentId, list)
  addStylesToDom(styles)

  return function update (newList) {
    var mayRemove = []
    for (var i = 0; i < styles.length; i++) {
      var item = styles[i]
      var domStyle = stylesInDom[item.id]
      domStyle.refs--
      mayRemove.push(domStyle)
    }
    if (newList) {
      styles = listToStyles(parentId, newList)
      addStylesToDom(styles)
    } else {
      styles = []
    }
    for (var i = 0; i < mayRemove.length; i++) {
      var domStyle = mayRemove[i]
      if (domStyle.refs === 0) {
        for (var j = 0; j < domStyle.parts.length; j++) {
          domStyle.parts[j]()
        }
        delete stylesInDom[domStyle.id]
      }
    }
  }
}

function addStylesToDom (styles /* Array<StyleObject> */) {
  for (var i = 0; i < styles.length; i++) {
    var item = styles[i]
    var domStyle = stylesInDom[item.id]
    if (domStyle) {
      domStyle.refs++
      for (var j = 0; j < domStyle.parts.length; j++) {
        domStyle.parts[j](item.parts[j])
      }
      for (; j < item.parts.length; j++) {
        domStyle.parts.push(addStyle(item.parts[j]))
      }
      if (domStyle.parts.length > item.parts.length) {
        domStyle.parts.length = item.parts.length
      }
    } else {
      var parts = []
      for (var j = 0; j < item.parts.length; j++) {
        parts.push(addStyle(item.parts[j]))
      }
      stylesInDom[item.id] = { id: item.id, refs: 1, parts: parts }
    }
  }
}

function createStyleElement () {
  var styleElement = document.createElement('style')
  styleElement.type = 'text/css'
  head.appendChild(styleElement)
  return styleElement
}

function addStyle (obj /* StyleObjectPart */) {
  var update, remove
  var styleElement = document.querySelector('style[' + ssrIdKey + '~="' + obj.id + '"]')

  if (styleElement) {
    if (isProduction) {
      // has SSR styles and in production mode.
      // simply do nothing.
      return noop
    } else {
      // has SSR styles but in dev mode.
      // for some reason Chrome can't handle source map in server-rendered
      // style tags - source maps in <style> only works if the style tag is
      // created and inserted dynamically. So we remove the server rendered
      // styles and inject new ones.
      styleElement.parentNode.removeChild(styleElement)
    }
  }

  if (isOldIE) {
    // use singleton mode for IE9.
    var styleIndex = singletonCounter++
    styleElement = singletonElement || (singletonElement = createStyleElement())
    update = applyToSingletonTag.bind(null, styleElement, styleIndex, false)
    remove = applyToSingletonTag.bind(null, styleElement, styleIndex, true)
  } else {
    // use multi-style-tag mode in all other cases
    styleElement = createStyleElement()
    update = applyToTag.bind(null, styleElement)
    remove = function () {
      styleElement.parentNode.removeChild(styleElement)
    }
  }

  update(obj)

  return function updateStyle (newObj /* StyleObjectPart */) {
    if (newObj) {
      if (newObj.css === obj.css &&
          newObj.media === obj.media &&
          newObj.sourceMap === obj.sourceMap) {
        return
      }
      update(obj = newObj)
    } else {
      remove()
    }
  }
}

var replaceText = (function () {
  var textStore = []

  return function (index, replacement) {
    textStore[index] = replacement
    return textStore.filter(Boolean).join('\n')
  }
})()

function applyToSingletonTag (styleElement, index, remove, obj) {
  var css = remove ? '' : obj.css

  if (styleElement.styleSheet) {
    styleElement.styleSheet.cssText = replaceText(index, css)
  } else {
    var cssNode = document.createTextNode(css)
    var childNodes = styleElement.childNodes
    if (childNodes[index]) styleElement.removeChild(childNodes[index])
    if (childNodes.length) {
      styleElement.insertBefore(cssNode, childNodes[index])
    } else {
      styleElement.appendChild(cssNode)
    }
  }
}

function applyToTag (styleElement, obj) {
  var css = obj.css
  var media = obj.media
  var sourceMap = obj.sourceMap

  if (media) {
    styleElement.setAttribute('media', media)
  }
  if (options.ssrId) {
    styleElement.setAttribute(ssrIdKey, obj.id)
  }

  if (sourceMap) {
    // https://developer.chrome.com/devtools/docs/javascript-debugging
    // this makes source maps inside style tags work properly in Chrome
    css += '\n/*# sourceURL=' + sourceMap.sources[0] + ' */'
    // http://stackoverflow.com/a/26603875
    css += '\n/*# sourceMappingURL=data:application/json;base64,' + btoa(unescape(encodeURIComponent(JSON.stringify(sourceMap)))) + ' */'
  }

  if (styleElement.styleSheet) {
    styleElement.styleSheet.cssText = css
  } else {
    while (styleElement.firstChild) {
      styleElement.removeChild(styleElement.firstChild)
    }
    styleElement.appendChild(document.createTextNode(css))
  }
}


/***/ }),

/***/ 927:
/***/ (function(module) {

"use strict";
module.exports = __WEBPACK_EXTERNAL_MODULE__927__;

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		var cachedModule = __webpack_module_cache__[moduleId];
/******/ 		if (cachedModule !== undefined) {
/******/ 			return cachedModule.exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			id: moduleId,
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
/******/ 	/* webpack/runtime/compat get default export */
/******/ 	!function() {
/******/ 		// getDefaultExport function for compatibility with non-harmony modules
/******/ 		__webpack_require__.n = function(module) {
/******/ 			var getter = module && module.__esModule ?
/******/ 				function() { return module['default']; } :
/******/ 				function() { return module; };
/******/ 			__webpack_require__.d(getter, { a: getter });
/******/ 			return getter;
/******/ 		};
/******/ 	}();
/******/ 	
/******/ 	/* webpack/runtime/define property getters */
/******/ 	!function() {
/******/ 		// define getter functions for harmony exports
/******/ 		__webpack_require__.d = function(exports, definition) {
/******/ 			for(var key in definition) {
/******/ 				if(__webpack_require__.o(definition, key) && !__webpack_require__.o(exports, key)) {
/******/ 					Object.defineProperty(exports, key, { enumerable: true, get: definition[key] });
/******/ 				}
/******/ 			}
/******/ 		};
/******/ 	}();
/******/ 	
/******/ 	/* webpack/runtime/hasOwnProperty shorthand */
/******/ 	!function() {
/******/ 		__webpack_require__.o = function(obj, prop) { return Object.prototype.hasOwnProperty.call(obj, prop); }
/******/ 	}();
/******/ 	
/******/ 	/* webpack/runtime/make namespace object */
/******/ 	!function() {
/******/ 		// define __esModule on exports
/******/ 		__webpack_require__.r = function(exports) {
/******/ 			if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 				Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 			}
/******/ 			Object.defineProperty(exports, '__esModule', { value: true });
/******/ 		};
/******/ 	}();
/******/ 	
/******/ 	/* webpack/runtime/publicPath */
/******/ 	!function() {
/******/ 		__webpack_require__.p = "";
/******/ 	}();
/******/ 	
/************************************************************************/
var __webpack_exports__ = {};
// This entry need to be wrapped in an IIFE because it need to be in strict mode.
!function() {
"use strict";

// EXPORTS
__webpack_require__.d(__webpack_exports__, {
  "default": function() { return /* binding */ entry_lib; }
});

// UNUSED EXPORTS: ERROR_TYPE, VueSliderDot, VueSliderMark

;// CONCATENATED MODULE: ./node_modules/.pnpm/@vue+cli-service@5.0.4_sass-loader@12.6.0/node_modules/@vue/cli-service/lib/commands/build/setPublicPath.js
/* eslint-disable no-var */
// This file is imported into lib/wc client bundles.

if (typeof window !== 'undefined') {
  var currentScript = window.document.currentScript
  if (true) {
    var getCurrentScript = __webpack_require__(388)
    currentScript = getCurrentScript()

    // for backward compatibility, because previously we directly included the polyfill
    if (!('currentScript' in document)) {
      Object.defineProperty(document, 'currentScript', { get: getCurrentScript })
    }
  }

  var src = currentScript && currentScript.src.match(/(.+\/)[^/]+\.js(\?.*)?$/)
  if (src) {
    __webpack_require__.p = src[1] // eslint-disable-line
  }
}

// Indicate to webpack that this file can be concatenated
/* harmony default export */ var setPublicPath = (null);

// EXTERNAL MODULE: external {"commonjs":"vue","commonjs2":"vue","root":"Vue","amd":"vue"}
var external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_ = __webpack_require__(927);
;// CONCATENATED MODULE: ./node_modules/.pnpm/babel-loader@8.2.5_rb5fcebzp6kx3hqg3ucus54t3m/node_modules/babel-loader/lib/index.js!./node_modules/.pnpm/ts-loader@9.3.0_esqjcmzo5pizlbillhrxoayzsy/node_modules/ts-loader/index.js??clonedRuleSet-86.use[1]!./node_modules/.pnpm/vue-loader@17.0.0_webpack@5.72.0/node_modules/vue-loader/dist/templateLoader.js??ruleSet[1].rules[4]!./node_modules/.pnpm/vue-loader@17.0.0_webpack@5.72.0/node_modules/vue-loader/dist/index.js??ruleSet[0].use[0]!./lib/vue-slider.vue?vue&type=template&id=3b83f6da&ts=true
function _defineProperty(obj, key, value) { if (key in obj) { Object.defineProperty(obj, key, { value: value, enumerable: true, configurable: true, writable: true }); } else { obj[key] = value; } return obj; }


var _hoisted_1 = {
  key: 0,
  class: "vue-slider-marks"
};
function render(_ctx, _cache, $props, $setup, $data, $options) {
  var _component_vue_slider_mark = (0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.resolveComponent)("vue-slider-mark");

  var _component_vue_slider_dot = (0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.resolveComponent)("vue-slider-dot");

  return (0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.openBlock)(), (0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.createElementBlock)("div", (0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.mergeProps)({
    ref: "container",
    class: _ctx.containerClasses,
    style: _ctx.containerStyles,
    onClick: _cache[2] || (_cache[2] = //@ts-ignore
    function () {
      return _ctx.clickHandle && _ctx.clickHandle.apply(_ctx, arguments);
    }),
    onTouchstartPassive: _cache[3] || (_cache[3] = //@ts-ignore
    function () {
      return _ctx.dragStartOnProcess && _ctx.dragStartOnProcess.apply(_ctx, arguments);
    }),
    onMousedownPassive: _cache[4] || (_cache[4] = //@ts-ignore
    function () {
      return _ctx.dragStartOnProcess && _ctx.dragStartOnProcess.apply(_ctx, arguments);
    })
  }, _ctx.$attrs), [(0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.createElementVNode)("div", {
    class: "vue-slider-rail",
    style: (0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.normalizeStyle)(_ctx.railStyle)
  }, [((0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.openBlock)(true), (0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.createElementBlock)(external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.Fragment, null, (0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.renderList)(_ctx.processArray, function (item, index) {
    return (0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.renderSlot)(_ctx.$slots, "process", (0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.normalizeProps)((0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.guardReactiveProps)(item)), function () {
      return [((0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.openBlock)(), (0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.createElementBlock)("div", {
        class: "vue-slider-process",
        key: "process-".concat(index),
        style: (0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.normalizeStyle)(item.style)
      }, null, 4))];
    });
  }), 256)), _ctx.sliderMarks && _ctx.control ? ((0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.openBlock)(), (0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.createElementBlock)("div", _hoisted_1, [((0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.openBlock)(true), (0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.createElementBlock)(external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.Fragment, null, (0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.renderList)(_ctx.control.markList, function (mark, index) {
    return (0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.renderSlot)(_ctx.$slots, "mark", (0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.normalizeProps)((0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.guardReactiveProps)(mark)), function () {
      var _normalizeStyle2;

      return [((0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.openBlock)(), (0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.createBlock)(_component_vue_slider_mark, {
        key: "mark-".concat(index),
        mark: mark,
        hideLabel: _ctx.hideLabel,
        style: (0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.normalizeStyle)((_normalizeStyle2 = {}, _defineProperty(_normalizeStyle2, _ctx.isHorizontal ? 'height' : 'width', '100%'), _defineProperty(_normalizeStyle2, _ctx.isHorizontal ? 'width' : 'height', _ctx.tailSize), _defineProperty(_normalizeStyle2, _ctx.mainDirection, "".concat(mark.pos, "%")), _normalizeStyle2)),
        stepStyle: _ctx.stepStyle,
        stepActiveStyle: _ctx.stepActiveStyle,
        labelStyle: _ctx.labelStyle,
        labelActiveStyle: _ctx.labelActiveStyle,
        onPressLabel: _cache[0] || (_cache[0] = function (pos) {
          return _ctx.clickable && _ctx.setValueByPos(pos);
        })
      }, {
        step: (0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.withCtx)(function () {
          return [(0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.renderSlot)(_ctx.$slots, "step", (0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.normalizeProps)((0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.guardReactiveProps)(mark)))];
        }),
        label: (0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.withCtx)(function () {
          return [(0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.renderSlot)(_ctx.$slots, "label", (0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.normalizeProps)((0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.guardReactiveProps)(mark)))];
        }),
        _: 2
      }, 1032, ["mark", "hideLabel", "style", "stepStyle", "stepActiveStyle", "labelStyle", "labelActiveStyle"]))];
    });
  }), 256))])) : (0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.createCommentVNode)("", true), ((0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.openBlock)(true), (0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.createElementBlock)(external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.Fragment, null, (0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.renderList)(_ctx.dots, function (dot, index) {
    var _ref;

    return (0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.openBlock)(), (0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.createBlock)(_component_vue_slider_dot, (0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.mergeProps)({
      ref_for: true,
      ref: "dot-".concat(index),
      key: "dot-".concat(index),
      value: dot.value,
      disabled: dot.disabled,
      focus: dot.focus,
      "dot-style": [dot.style, dot.disabled ? dot.disabledStyle : null, dot.focus ? dot.focusStyle : null],
      tooltip: dot.tooltip || _ctx.tooltip,
      "tooltip-style": [_ctx.tooltipStyle, dot.tooltipStyle, dot.disabled ? dot.tooltipDisabledStyle : null, dot.focus ? dot.tooltipFocusStyle : null],
      "tooltip-formatter": Array.isArray(_ctx.sliderTooltipFormatter) ? _ctx.sliderTooltipFormatter[index] : _ctx.sliderTooltipFormatter,
      "tooltip-placement": _ctx.tooltipDirections[index],
      style: [_ctx.dotBaseStyle, (_ref = {}, _defineProperty(_ref, _ctx.mainDirection, "".concat(dot.pos, "%")), _defineProperty(_ref, "transition", "".concat(_ctx.mainDirection, " ").concat(_ctx.animateTime, "s")), _ref)],
      onDragStart: function onDragStart() {
        return _ctx.dragStart(index);
      },
      role: "slider",
      "aria-valuenow": dot.value,
      "aria-valuemin": _ctx.min,
      "aria-valuemax": _ctx.max,
      "aria-orientation": _ctx.isHorizontal ? 'horizontal' : 'vertical',
      tabindex: "0",
      onFocus: function onFocus() {
        return _ctx.focus(dot, index);
      },
      onBlur: _cache[1] || (_cache[1] = function () {
        return _ctx.blur();
      })
    }, _ctx.dotAttrs), {
      dot: (0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.withCtx)(function () {
        return [(0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.renderSlot)(_ctx.$slots, "dot", (0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.normalizeProps)((0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.guardReactiveProps)(dot)))];
      }),
      tooltip: (0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.withCtx)(function () {
        return [(0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.renderSlot)(_ctx.$slots, "tooltip", (0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.normalizeProps)((0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.guardReactiveProps)(dot)))];
      }),
      _: 2
    }, 1040, ["value", "disabled", "focus", "dot-style", "tooltip", "tooltip-style", "tooltip-formatter", "tooltip-placement", "style", "onDragStart", "aria-valuenow", "aria-valuemin", "aria-valuemax", "aria-orientation", "onFocus"]);
  }), 128))], 4), (0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.renderSlot)(_ctx.$slots, "default", {
    value: _ctx.getValue()
  })], 16);
}
;// CONCATENATED MODULE: ./lib/vue-slider.vue?vue&type=template&id=3b83f6da&ts=true

;// CONCATENATED MODULE: ./node_modules/.pnpm/babel-loader@8.2.5_rb5fcebzp6kx3hqg3ucus54t3m/node_modules/babel-loader/lib/index.js!./node_modules/.pnpm/ts-loader@9.3.0_esqjcmzo5pizlbillhrxoayzsy/node_modules/ts-loader/index.js??clonedRuleSet-86.use[1]!./node_modules/.pnpm/vue-loader@17.0.0_webpack@5.72.0/node_modules/vue-loader/dist/templateLoader.js??ruleSet[1].rules[4]!./node_modules/.pnpm/vue-loader@17.0.0_webpack@5.72.0/node_modules/vue-loader/dist/index.js??ruleSet[0].use[0]!./lib/vue-slider-dot.vue?vue&type=template&id=279d0624&ts=true

var vue_slider_dotvue_type_template_id_279d0624_ts_true_hoisted_1 = ["aria-valuetext"];
var _hoisted_2 = {
  class: "vue-slider-dot-tooltip-text"
};
function vue_slider_dotvue_type_template_id_279d0624_ts_true_render(_ctx, _cache, $props, $setup, $data, $options) {
  var _ctx$tooltipValue;

  return (0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.openBlock)(), (0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.createElementBlock)("div", {
    ref: "dot",
    class: (0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.normalizeClass)(_ctx.dotClasses),
    "aria-valuetext": (_ctx$tooltipValue = _ctx.tooltipValue) === null || _ctx$tooltipValue === void 0 ? void 0 : _ctx$tooltipValue.toString(),
    onMousedownPassive: _cache[0] || (_cache[0] = //@ts-ignore
    function () {
      return _ctx.dragStart && _ctx.dragStart.apply(_ctx, arguments);
    }),
    onTouchstartPassive: _cache[1] || (_cache[1] = //@ts-ignore
    function () {
      return _ctx.dragStart && _ctx.dragStart.apply(_ctx, arguments);
    })
  }, [(0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.renderSlot)(_ctx.$slots, "dot", {}, function () {
    return [(0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.createElementVNode)("div", {
      class: (0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.normalizeClass)(_ctx.handleClasses),
      style: (0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.normalizeStyle)(_ctx.dotStyle)
    }, null, 6)];
  }), _ctx.tooltip !== 'none' ? ((0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.openBlock)(), (0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.createElementBlock)("div", {
    key: 0,
    class: (0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.normalizeClass)(_ctx.tooltipClasses)
  }, [(0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.renderSlot)(_ctx.$slots, "tooltip", {}, function () {
    return [(0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.createElementVNode)("div", {
      class: (0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.normalizeClass)(_ctx.tooltipInnerClasses),
      style: (0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.normalizeStyle)(_ctx.tooltipStyle)
    }, [(0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.createElementVNode)("span", _hoisted_2, (0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.toDisplayString)(_ctx.tooltipValue), 1)], 6)];
  })], 2)) : (0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.createCommentVNode)("", true)], 42, vue_slider_dotvue_type_template_id_279d0624_ts_true_hoisted_1);
}
;// CONCATENATED MODULE: ./lib/vue-slider-dot.vue?vue&type=template&id=279d0624&ts=true

// EXTERNAL MODULE: ./lib/styles/dot.scss
var dot = __webpack_require__(259);
;// CONCATENATED MODULE: ./node_modules/.pnpm/babel-loader@8.2.5_rb5fcebzp6kx3hqg3ucus54t3m/node_modules/babel-loader/lib/index.js!./node_modules/.pnpm/ts-loader@9.3.0_esqjcmzo5pizlbillhrxoayzsy/node_modules/ts-loader/index.js??clonedRuleSet-86.use[1]!./node_modules/.pnpm/vue-loader@17.0.0_webpack@5.72.0/node_modules/vue-loader/dist/index.js??ruleSet[0].use[0]!./lib/vue-slider-dot.vue?vue&type=script&lang=ts


/* harmony default export */ var vue_slider_dotvue_type_script_lang_ts = ((0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.defineComponent)({
  name: 'VueSliderDot',
  emits: ['drag-start'],
  props: {
    value: {
      type: [String, Number],
      default: 0
    },
    tooltip: {
      type: String,
      required: true
    },
    tooltipPlacement: {
      type: String,
      validator: function validator(val) {
        return ['top', 'right', 'bottom', 'left'].indexOf(val) > -1;
      },
      required: true
    },
    tooltipFormatter: {
      type: [String, Function]
    },
    focus: {
      type: Boolean,
      default: false
    },
    disabled: {
      type: Boolean,
      default: false
    },
    dotStyle: {
      type: Object
    },
    tooltipStyle: {
      type: Object
    }
  },
  computed: {
    dotClasses: function dotClasses() {
      return ['vue-slider-dot', {
        'vue-slider-dot-hover': this.tooltip === 'hover' || this.tooltip === 'active',
        'vue-slider-dot-disabled': this.disabled,
        'vue-slider-dot-focus': this.focus
      }];
    },
    handleClasses: function handleClasses() {
      return ['vue-slider-dot-handle', {
        'vue-slider-dot-handle-disabled': this.disabled,
        'vue-slider-dot-handle-focus': this.focus
      }];
    },
    tooltipClasses: function tooltipClasses() {
      return ['vue-slider-dot-tooltip', ["vue-slider-dot-tooltip-".concat(this.tooltipPlacement)], {
        'vue-slider-dot-tooltip-show': this.showTooltip
      }];
    },
    tooltipInnerClasses: function tooltipInnerClasses() {
      return ['vue-slider-dot-tooltip-inner', ["vue-slider-dot-tooltip-inner-".concat(this.tooltipPlacement)], {
        'vue-slider-dot-tooltip-inner-disabled': this.disabled,
        'vue-slider-dot-tooltip-inner-focus': this.focus
      }];
    },
    showTooltip: function showTooltip() {
      switch (this.tooltip) {
        case 'always':
          return true;

        case 'none':
          return false;

        case 'focus':
        case 'active':
          return !!this.focus;

        default:
          return false;
      }
    },
    tooltipValue: function tooltipValue() {
      if (this.tooltipFormatter) {
        return typeof this.tooltipFormatter === 'string' ? this.tooltipFormatter.replace(/\{value\}/, String(this.value)) : this.tooltipFormatter(this.value);
      } else {
        return this.value;
      }
    }
  },
  methods: {
    dragStart: function dragStart() {
      if (this.disabled) {
        return false;
      }

      this.$emit('drag-start');
    }
  }
}));
;// CONCATENATED MODULE: ./lib/vue-slider-dot.vue?vue&type=script&lang=ts
 
// EXTERNAL MODULE: ./node_modules/.pnpm/vue-loader@17.0.0_webpack@5.72.0/node_modules/vue-loader/dist/exportHelper.js
var exportHelper = __webpack_require__(831);
;// CONCATENATED MODULE: ./lib/vue-slider-dot.vue




;
const __exports__ = /*#__PURE__*/(0,exportHelper/* default */.Z)(vue_slider_dotvue_type_script_lang_ts, [['render',vue_slider_dotvue_type_template_id_279d0624_ts_true_render]])

/* harmony default export */ var vue_slider_dot = (__exports__);
;// CONCATENATED MODULE: ./node_modules/.pnpm/babel-loader@8.2.5_rb5fcebzp6kx3hqg3ucus54t3m/node_modules/babel-loader/lib/index.js!./node_modules/.pnpm/ts-loader@9.3.0_esqjcmzo5pizlbillhrxoayzsy/node_modules/ts-loader/index.js??clonedRuleSet-86.use[1]!./node_modules/.pnpm/vue-loader@17.0.0_webpack@5.72.0/node_modules/vue-loader/dist/templateLoader.js??ruleSet[1].rules[4]!./node_modules/.pnpm/vue-loader@17.0.0_webpack@5.72.0/node_modules/vue-loader/dist/index.js??ruleSet[0].use[0]!./lib/vue-slider-mark.vue?vue&type=template&id=0bb4266c&ts=true

function vue_slider_markvue_type_template_id_0bb4266c_ts_true_render(_ctx, _cache, $props, $setup, $data, $options) {
  return (0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.openBlock)(), (0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.createElementBlock)("div", {
    class: (0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.normalizeClass)(_ctx.marksClasses)
  }, [(0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.renderSlot)(_ctx.$slots, "step", {}, function () {
    return [(0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.createElementVNode)("div", {
      class: (0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.normalizeClass)(_ctx.stepClasses),
      style: (0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.normalizeStyle)([_ctx.stepStyle, _ctx.mark.style || {}, _ctx.mark.active && _ctx.stepActiveStyle ? _ctx.stepActiveStyle : {}, _ctx.mark.active && _ctx.mark.activeStyle ? _ctx.mark.activeStyle : {}])
    }, null, 6)];
  }), !_ctx.hideLabel ? (0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.renderSlot)(_ctx.$slots, "label", {
    key: 0
  }, function () {
    return [(0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.createElementVNode)("div", {
      class: (0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.normalizeClass)(_ctx.labelClasses),
      style: (0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.normalizeStyle)([_ctx.labelStyle, _ctx.mark.labelStyle || {}, _ctx.mark.active && _ctx.labelActiveStyle ? _ctx.labelActiveStyle : {}, _ctx.mark.active && _ctx.mark.labelActiveStyle ? _ctx.mark.labelActiveStyle : {}]),
      onClick: _cache[0] || (_cache[0] = //@ts-ignore
      function () {
        return _ctx.labelClickHandle && _ctx.labelClickHandle.apply(_ctx, arguments);
      })
    }, (0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.toDisplayString)(_ctx.mark.label), 7)];
  }) : (0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.createCommentVNode)("", true)], 2);
}
;// CONCATENATED MODULE: ./lib/vue-slider-mark.vue?vue&type=template&id=0bb4266c&ts=true

// EXTERNAL MODULE: ./lib/styles/mark.scss
var mark = __webpack_require__(714);
;// CONCATENATED MODULE: ./node_modules/.pnpm/babel-loader@8.2.5_rb5fcebzp6kx3hqg3ucus54t3m/node_modules/babel-loader/lib/index.js!./node_modules/.pnpm/ts-loader@9.3.0_esqjcmzo5pizlbillhrxoayzsy/node_modules/ts-loader/index.js??clonedRuleSet-86.use[1]!./node_modules/.pnpm/vue-loader@17.0.0_webpack@5.72.0/node_modules/vue-loader/dist/index.js??ruleSet[0].use[0]!./lib/vue-slider-mark.vue?vue&type=script&lang=ts


/* harmony default export */ var vue_slider_markvue_type_script_lang_ts = ((0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.defineComponent)({
  name: 'VueSliderMark',
  emits: ['press-label'],
  props: {
    mark: {
      type: Object,
      required: true
    },
    hideLabel: {
      type: Boolean
    },
    stepStyle: {
      type: Object,
      default: function _default() {
        return {};
      }
    },
    stepActiveStyle: {
      type: Object,
      default: function _default() {
        return {};
      }
    },
    labelStyle: {
      type: Object,
      default: function _default() {
        return {};
      }
    },
    labelActiveStyle: {
      type: Object,
      default: function _default() {
        return {};
      }
    }
  },
  computed: {
    marksClasses: function marksClasses() {
      return ['vue-slider-mark', {
        'vue-slider-mark-active': this.mark.active
      }];
    },
    stepClasses: function stepClasses() {
      return ['vue-slider-mark-step', {
        'vue-slider-mark-step-active': this.mark.active
      }];
    },
    labelClasses: function labelClasses() {
      return ['vue-slider-mark-label', {
        'vue-slider-mark-label-active': this.mark.active
      }];
    }
  },
  methods: {
    labelClickHandle: function labelClickHandle(e) {
      e.stopPropagation();
      this.$emit('press-label', this.mark.pos);
    }
  }
}));
;// CONCATENATED MODULE: ./lib/vue-slider-mark.vue?vue&type=script&lang=ts
 
;// CONCATENATED MODULE: ./lib/vue-slider-mark.vue




;
const vue_slider_mark_exports_ = /*#__PURE__*/(0,exportHelper/* default */.Z)(vue_slider_markvue_type_script_lang_ts, [['render',vue_slider_markvue_type_template_id_0bb4266c_ts_true_render]])

/* harmony default export */ var vue_slider_mark = (vue_slider_mark_exports_);
;// CONCATENATED MODULE: ./lib/utils/index.ts
var getSize = function getSize(value) {
  return typeof value === 'number' ? "".concat(value, "px") : value;
};
/** Get the distance of the element from the top/left of the page */

var getOffset = function getOffset(elem) {
  var doc = document.documentElement;
  var body = document.body;
  var rect = elem.getBoundingClientRect();
  var offset = {
    y: rect.top + (window.pageYOffset || doc.scrollTop) - (doc.clientTop || body.clientTop || 0),
    x: rect.left + (window.pageXOffset || doc.scrollLeft) - (doc.clientLeft || body.clientLeft || 0)
  };
  return offset;
};
/**
 * Get the position of the mouse/finger in the element
 * @param e Trigger event
 * @param elem Container element
 * @param isReverse From the right/bottom
 */

var getPos = function getPos(e, elem, isReverse) {
  var zoom = arguments.length > 3 && arguments[3] !== undefined ? arguments[3] : 1;
  var event = 'targetTouches' in e ? e.targetTouches[0] : e;
  var offset = getOffset(elem);
  var posObj = {
    x: event.pageX - offset.x,
    y: event.pageY - offset.y
  };
  return {
    x: isReverse ? elem.offsetWidth * zoom - posObj.x : posObj.x,
    y: isReverse ? elem.offsetHeight * zoom - posObj.y : posObj.y
  };
};
var KEY_CODE;

(function (KEY_CODE) {
  KEY_CODE[KEY_CODE["PAGE_UP"] = 33] = "PAGE_UP";
  KEY_CODE[KEY_CODE["PAGE_DOWN"] = 34] = "PAGE_DOWN";
  KEY_CODE[KEY_CODE["END"] = 35] = "END";
  KEY_CODE[KEY_CODE["HOME"] = 36] = "HOME";
  KEY_CODE[KEY_CODE["LEFT"] = 37] = "LEFT";
  KEY_CODE[KEY_CODE["UP"] = 38] = "UP";
  KEY_CODE[KEY_CODE["RIGHT"] = 39] = "RIGHT";
  KEY_CODE[KEY_CODE["DOWN"] = 40] = "DOWN";
})(KEY_CODE || (KEY_CODE = {}));

var getKeyboardHandleFunc = function getKeyboardHandleFunc(e, params) {
  if (params.hook) {
    var result = params.hook(e);
    if (typeof result === 'function') return result;
    if (!result) return null;
  }

  switch (e.keyCode) {
    case KEY_CODE.UP:
      return function (i) {
        return params.direction === 'ttb' ? i - 1 : i + 1;
      };

    case KEY_CODE.RIGHT:
      return function (i) {
        return params.direction === 'rtl' ? i - 1 : i + 1;
      };

    case KEY_CODE.DOWN:
      return function (i) {
        return params.direction === 'ttb' ? i + 1 : i - 1;
      };

    case KEY_CODE.LEFT:
      return function (i) {
        return params.direction === 'rtl' ? i + 1 : i - 1;
      };

    case KEY_CODE.END:
      return function () {
        return params.max;
      };

    case KEY_CODE.HOME:
      return function () {
        return params.min;
      };

    case KEY_CODE.PAGE_UP:
      return function (i) {
        return i + 10;
      };

    case KEY_CODE.PAGE_DOWN:
      return function (i) {
        return i - 10;
      };

    default:
      return null;
  }
};
;// CONCATENATED MODULE: ./lib/utils/decimal.ts
function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); Object.defineProperty(Constructor, "prototype", { writable: false }); return Constructor; }

function decimal_defineProperty(obj, key, value) { if (key in obj) { Object.defineProperty(obj, key, { value: value, enumerable: true, configurable: true, writable: true }); } else { obj[key] = value; } return obj; }

/**
 * For any precise floating point calculation
 *
 * @export
 * @class Decimal
 */
var Decimal = /*#__PURE__*/function () {
  function Decimal(num) {
    _classCallCheck(this, Decimal);

    decimal_defineProperty(this, "num", void 0);

    this.num = num;
  }

  _createClass(Decimal, [{
    key: "decimal",
    value: function decimal(num2, operator) {
      var num1 = this.num;
      var len1 = this.getDecimalLen(num1);
      var len2 = this.getDecimalLen(num2);
      var base = 0;

      switch (operator) {
        case '+':
          base = this.getExponent(len1, len2);
          this.num = (this.safeRoundUp(num1, base) + this.safeRoundUp(num2, base)) / base;
          break;

        case '-':
          base = this.getExponent(len1, len2);
          this.num = (this.safeRoundUp(num1, base) - this.safeRoundUp(num2, base)) / base;
          break;

        case '*':
          this.num = this.safeRoundUp(this.safeRoundUp(num1, this.getExponent(len1)), this.safeRoundUp(num2, this.getExponent(len2))) / this.getExponent(len1 + len2);
          break;

        case '/':
          base = this.getExponent(len1, len2);
          this.num = this.safeRoundUp(num1, base) / this.safeRoundUp(num2, base);
          break;

        case '%':
          base = this.getExponent(len1, len2);
          this.num = this.safeRoundUp(num1, base) % this.safeRoundUp(num2, base) / base;
          break;
      }

      return this;
    }
  }, {
    key: "plus",
    value: function plus(num2) {
      return this.decimal(num2, '+');
    }
  }, {
    key: "minus",
    value: function minus(num2) {
      return this.decimal(num2, '-');
    }
  }, {
    key: "multiply",
    value: function multiply(num2) {
      return this.decimal(num2, '*');
    }
  }, {
    key: "divide",
    value: function divide(num2) {
      return this.decimal(num2, '/');
    }
  }, {
    key: "remainder",
    value: function remainder(num2) {
      return this.decimal(num2, '%');
    }
  }, {
    key: "toNumber",
    value: function toNumber() {
      return this.num;
    }
  }, {
    key: "getDecimalLen",
    value: function getDecimalLen(num) {
      var strArr = "".concat(num).split('e');
      return ("".concat(strArr[0]).split('.')[1] || '').length - (strArr[1] ? +strArr[1] : 0);
    }
  }, {
    key: "getExponent",
    value: function getExponent(num1, num2) {
      return Math.pow(10, num2 !== void 0 ? Math.max(num1, num2) : num1);
    } // fix: 9999999.99995 * 100000 = 999999999994.9999

  }, {
    key: "safeRoundUp",
    value: function safeRoundUp(num, exponent) {
      return Math.round(num * exponent);
    }
  }]);

  return Decimal;
}();


;// CONCATENATED MODULE: ./lib/utils/control.ts
var _ERROR_MSG;

function _slicedToArray(arr, i) { return _arrayWithHoles(arr) || _iterableToArrayLimit(arr, i) || _unsupportedIterableToArray(arr, i) || _nonIterableRest(); }

function _nonIterableRest() { throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."); }

function _iterableToArrayLimit(arr, i) { var _i = arr == null ? null : typeof Symbol !== "undefined" && arr[Symbol.iterator] || arr["@@iterator"]; if (_i == null) return; var _arr = []; var _n = true; var _d = false; var _s, _e; try { for (_i = _i.call(arr); !(_n = (_s = _i.next()).done); _n = true) { _arr.push(_s.value); if (i && _arr.length === i) break; } } catch (err) { _d = true; _e = err; } finally { try { if (!_n && _i["return"] != null) _i["return"](); } finally { if (_d) throw _e; } } return _arr; }

function _arrayWithHoles(arr) { if (Array.isArray(arr)) return arr; }

function ownKeys(object, enumerableOnly) { var keys = Object.keys(object); if (Object.getOwnPropertySymbols) { var symbols = Object.getOwnPropertySymbols(object); enumerableOnly && (symbols = symbols.filter(function (sym) { return Object.getOwnPropertyDescriptor(object, sym).enumerable; })), keys.push.apply(keys, symbols); } return keys; }

function _objectSpread(target) { for (var i = 1; i < arguments.length; i++) { var source = null != arguments[i] ? arguments[i] : {}; i % 2 ? ownKeys(Object(source), !0).forEach(function (key) { control_defineProperty(target, key, source[key]); }) : Object.getOwnPropertyDescriptors ? Object.defineProperties(target, Object.getOwnPropertyDescriptors(source)) : ownKeys(Object(source)).forEach(function (key) { Object.defineProperty(target, key, Object.getOwnPropertyDescriptor(source, key)); }); } return target; }

function _toConsumableArray(arr) { return _arrayWithoutHoles(arr) || _iterableToArray(arr) || _unsupportedIterableToArray(arr) || _nonIterableSpread(); }

function _nonIterableSpread() { throw new TypeError("Invalid attempt to spread non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."); }

function _unsupportedIterableToArray(o, minLen) { if (!o) return; if (typeof o === "string") return _arrayLikeToArray(o, minLen); var n = Object.prototype.toString.call(o).slice(8, -1); if (n === "Object" && o.constructor) n = o.constructor.name; if (n === "Map" || n === "Set") return Array.from(o); if (n === "Arguments" || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return _arrayLikeToArray(o, minLen); }

function _iterableToArray(iter) { if (typeof Symbol !== "undefined" && iter[Symbol.iterator] != null || iter["@@iterator"] != null) return Array.from(iter); }

function _arrayWithoutHoles(arr) { if (Array.isArray(arr)) return _arrayLikeToArray(arr); }

function _arrayLikeToArray(arr, len) { if (len == null || len > arr.length) len = arr.length; for (var i = 0, arr2 = new Array(len); i < len; i++) { arr2[i] = arr[i]; } return arr2; }

function control_classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function control_defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function control_createClass(Constructor, protoProps, staticProps) { if (protoProps) control_defineProperties(Constructor.prototype, protoProps); if (staticProps) control_defineProperties(Constructor, staticProps); Object.defineProperty(Constructor, "prototype", { writable: false }); return Constructor; }

function control_defineProperty(obj, key, value) { if (key in obj) { Object.defineProperty(obj, key, { value: value, enumerable: true, configurable: true, writable: true }); } else { obj[key] = value; } return obj; }


var ERROR_TYPE;

(function (ERROR_TYPE) {
  ERROR_TYPE[ERROR_TYPE["VALUE"] = 1] = "VALUE";
  ERROR_TYPE[ERROR_TYPE["INTERVAL"] = 2] = "INTERVAL";
  ERROR_TYPE[ERROR_TYPE["MIN"] = 3] = "MIN";
  ERROR_TYPE[ERROR_TYPE["MAX"] = 4] = "MAX";
  ERROR_TYPE[ERROR_TYPE["ORDER"] = 5] = "ORDER";
})(ERROR_TYPE || (ERROR_TYPE = {}));

var ERROR_MSG = (_ERROR_MSG = {}, control_defineProperty(_ERROR_MSG, ERROR_TYPE.VALUE, 'The type of the "value" is illegal'), control_defineProperty(_ERROR_MSG, ERROR_TYPE.INTERVAL, 'The prop "interval" is invalid, "(max - min)" must be divisible by "interval"'), control_defineProperty(_ERROR_MSG, ERROR_TYPE.MIN, 'The "value" must be greater than or equal to the "min".'), control_defineProperty(_ERROR_MSG, ERROR_TYPE.MAX, 'The "value" must be less than or equal to the "max".'), control_defineProperty(_ERROR_MSG, ERROR_TYPE.ORDER, 'When "order" is false, the parameters "minRange", "maxRange", "fixed", "enabled" are invalid.'), _ERROR_MSG);
/**
 * Slider logic control center
 *
 * @export
 * @class Control
 */

var Control = /*#__PURE__*/function () {
  // The position of each slider
  // The value of each slider
  function Control(options) {
    control_classCallCheck(this, Control);

    control_defineProperty(this, "dotsPos", []);

    control_defineProperty(this, "dotsValue", []);

    control_defineProperty(this, "data", void 0);

    control_defineProperty(this, "enableCross", void 0);

    control_defineProperty(this, "fixed", void 0);

    control_defineProperty(this, "max", void 0);

    control_defineProperty(this, "min", void 0);

    control_defineProperty(this, "interval", void 0);

    control_defineProperty(this, "minRange", void 0);

    control_defineProperty(this, "maxRange", void 0);

    control_defineProperty(this, "order", void 0);

    control_defineProperty(this, "marks", void 0);

    control_defineProperty(this, "included", void 0);

    control_defineProperty(this, "process", void 0);

    control_defineProperty(this, "adsorb", void 0);

    control_defineProperty(this, "dotOptions", void 0);

    control_defineProperty(this, "onError", void 0);

    control_defineProperty(this, "cacheRangeDir", {});

    this.data = options.data;
    this.max = options.max;
    this.min = options.min;
    this.interval = options.interval;
    this.order = options.order;
    this.marks = options.marks;
    this.included = options.included;
    this.process = options.process;
    this.adsorb = options.adsorb;
    this.dotOptions = options.dotOptions;
    this.onError = options.onError;

    if (this.order) {
      this.minRange = options.minRange || 0;
      this.maxRange = options.maxRange || 0;
      this.enableCross = options.enableCross;
      this.fixed = options.fixed;
    } else {
      if (options.minRange || options.maxRange || !options.enableCross || options.fixed) {
        this.emitError(ERROR_TYPE.ORDER);
      }

      this.minRange = 0;
      this.maxRange = 0;
      this.enableCross = true;
      this.fixed = false;
    }

    this.setValue(options.value);
  }

  control_createClass(Control, [{
    key: "setValue",
    value: function setValue(value) {
      this.setDotsValue(Array.isArray(value) ? _toConsumableArray(value) : [value], true);
    }
  }, {
    key: "setDotsValue",
    value: function setDotsValue(value, syncPos) {
      this.dotsValue = value;

      if (syncPos) {
        this.syncDotsPos();
      }
    } // Set the slider position

  }, {
    key: "setDotsPos",
    value: function setDotsPos(dotsPos) {
      var _this = this;

      var list = this.order ? _toConsumableArray(dotsPos).sort(function (a, b) {
        return a - b;
      }) : dotsPos;
      this.dotsPos = list;
      this.setDotsValue(list.map(function (dotPos) {
        return _this.getValueByPos(dotPos);
      }), this.adsorb);
    } // Get value by position

  }, {
    key: "getValueByPos",
    value: function getValueByPos(pos) {
      var value = this.parsePos(pos); // When included is true, the return value is the value of the nearest mark

      if (this.included) {
        var dir = 100;
        this.markList.forEach(function (mark) {
          var curDir = Math.abs(mark.pos - pos);

          if (curDir < dir) {
            dir = curDir;
            value = mark.value;
          }
        });
      }

      return value;
    } // Sync slider position

  }, {
    key: "syncDotsPos",
    value: function syncDotsPos() {
      var _this2 = this;

      this.dotsPos = this.dotsValue.map(function (v) {
        return _this2.parseValue(v);
      });
    }
    /**
     * Get all the marks
     *
     * @readonly
     * @type {Mark[]}
     * @memberof Control
     */

  }, {
    key: "markList",
    get: function get() {
      var _this3 = this;

      if (!this.marks) {
        return [];
      }

      var getMarkByValue = function getMarkByValue(value, mark) {
        var pos = _this3.parseValue(value);

        return _objectSpread({
          pos: pos,
          value: value,
          label: value,
          active: _this3.isActiveByPos(pos)
        }, mark);
      };

      if (this.marks === true) {
        return this.getValues().map(function (value) {
          return getMarkByValue(value);
        });
      } else if (Object.prototype.toString.call(this.marks) === '[object Object]') {
        return Object.keys(this.marks).sort(function (a, b) {
          return +a - +b;
        }).map(function (value) {
          var item = _this3.marks[value];
          return getMarkByValue(value, typeof item !== 'string' ? item : {
            label: item
          });
        });
      } else if (Array.isArray(this.marks)) {
        return this.marks.map(function (value) {
          return getMarkByValue(value);
        });
      } else if (typeof this.marks === 'function') {
        return this.getValues().map(function (value) {
          return {
            value: value,
            result: _this3.marks(value)
          };
        }).filter(function (_ref) {
          var result = _ref.result;
          return !!result;
        }).map(function (_ref2) {
          var value = _ref2.value,
              result = _ref2.result;
          return getMarkByValue(value, result);
        });
      } else {
        return [];
      }
    }
    /**
     * Get the most recent slider index by position
     *
     * @param {number} pos
     * @returns {number}
     * @memberof Control
     */

  }, {
    key: "getRecentDot",
    value: function getRecentDot(pos) {
      var arr = this.dotsPos.map(function (dotPos) {
        return Math.abs(dotPos - pos);
      });
      return arr.indexOf(Math.min.apply(Math, _toConsumableArray(arr)));
    }
    /**
     * Get index by value
     *
     * @param {Value} value
     * @returns {number}
     * @memberof Control
     */

  }, {
    key: "getIndexByValue",
    value: function getIndexByValue(value) {
      if (this.data) {
        return this.data.indexOf(value);
      }

      return new Decimal(+value).minus(this.min).divide(this.interval).toNumber();
    }
    /**
     * Get value by index
     *
     * @param {index} number
     * @returns {Value}
     * @memberof Control
     */

  }, {
    key: "getValueByIndex",
    value: function getValueByIndex(index) {
      if (index < 0) {
        index = 0;
      } else if (index > this.total) {
        index = this.total;
      }

      return this.data ? this.data[index] : new Decimal(index).multiply(this.interval).plus(this.min).toNumber();
    }
    /**
     * Set the position of a single slider
     *
     * @param {number} pos
     * @param {number} index
     */

  }, {
    key: "setDotPos",
    value: function setDotPos(pos, index) {
      pos = this.getValidPos(pos, index).pos;
      var changePos = pos - this.dotsPos[index];

      if (!changePos) {
        return;
      }

      var changePosArr = new Array(this.dotsPos.length);

      if (this.fixed) {
        changePosArr = this.getFixedChangePosArr(changePos, index);
      } else if (this.minRange || this.maxRange) {
        changePosArr = this.getLimitRangeChangePosArr(pos, changePos, index);
      } else {
        changePosArr[index] = changePos;
      }

      this.setDotsPos(this.dotsPos.map(function (curPos, i) {
        return curPos + (changePosArr[i] || 0);
      }));
    }
    /**
     * In fixed mode, get the position of all slider changes
     *
     * @param {number} changePos Change distance of a single slider
     * @param {number} index slider index
     * @returns {DotsPosChangeArray}
     * @memberof Control
     */

  }, {
    key: "getFixedChangePosArr",
    value: function getFixedChangePosArr(changePos, index) {
      var _this4 = this;

      this.dotsPos.forEach(function (originPos, i) {
        if (i !== index) {
          var _this4$getValidPos = _this4.getValidPos(originPos + changePos, i),
              lastPos = _this4$getValidPos.pos,
              inRange = _this4$getValidPos.inRange;

          if (!inRange) {
            changePos = Math.min(Math.abs(lastPos - originPos), Math.abs(changePos)) * (changePos < 0 ? -1 : 1);
          }
        }
      });
      return this.dotsPos.map(function (_) {
        return changePos;
      });
    }
    /**
     * In minRange/maxRange mode, get the position of all slider changes
     *
     * @param {number} pos position of a single slider
     * @param {number} changePos Change distance of a single slider
     * @param {number} index slider index
     * @returns {DotsPosChangeArray}
     * @memberof Control
     */

  }, {
    key: "getLimitRangeChangePosArr",
    value: function getLimitRangeChangePosArr(pos, changePos, index) {
      var _this5 = this;

      var changeDots = [{
        index: index,
        changePos: changePos
      }];
      var newChangePos = changePos;
      [this.minRange, this.maxRange].forEach(function (isLimitRange, rangeIndex) {
        if (!isLimitRange) {
          return false;
        }

        var isMinRange = rangeIndex === 0;
        var isForward = changePos > 0;
        var next = 0;

        if (isMinRange) {
          next = isForward ? 1 : -1;
        } else {
          next = isForward ? -1 : 1;
        } // Determine if the two positions are within the legal interval


        var inLimitRange = function inLimitRange(pos2, pos1) {
          var diff = Math.abs(pos2 - pos1);
          return isMinRange ? diff < _this5.minRangeDir : diff > _this5.maxRangeDir;
        };

        var i = index + next;
        var nextPos = _this5.dotsPos[i];
        var curPos = pos;

        while (_this5.isPos(nextPos) && inLimitRange(nextPos, curPos)) {
          var _this5$getValidPos = _this5.getValidPos(nextPos + newChangePos, i),
              lastPos = _this5$getValidPos.pos;

          changeDots.push({
            index: i,
            changePos: lastPos - nextPos
          });
          i = i + next;
          curPos = lastPos;
          nextPos = _this5.dotsPos[i];
        }
      });
      return this.dotsPos.map(function (_, i) {
        var changeDot = changeDots.filter(function (dot) {
          return dot.index === i;
        });
        return changeDot.length ? changeDot[0].changePos : 0;
      });
    }
  }, {
    key: "isPos",
    value: function isPos(pos) {
      return typeof pos === 'number';
    }
    /**
     * Get a valid position by pos
     *
     * @param {number} pos
     * @param {number} index
     * @returns {{ pos: number, inRange: boolean }}
     */

  }, {
    key: "getValidPos",
    value: function getValidPos(pos, index) {
      var range = this.valuePosRange[index];
      var inRange = true;

      if (pos < range[0]) {
        pos = range[0];
        inRange = false;
      } else if (pos > range[1]) {
        pos = range[1];
        inRange = false;
      }

      return {
        pos: pos,
        inRange: inRange
      };
    }
    /**
     * Calculate the position of the slider by value
     *
     * @param {Value} val
     * @returns {number}
     */

  }, {
    key: "parseValue",
    value: function parseValue(val) {
      if (this.data) {
        val = this.data.indexOf(val);
      } else if (typeof val === 'number' || typeof val === 'string') {
        val = +val;

        if (val < this.min) {
          this.emitError(ERROR_TYPE.MIN);
          return 0;
        }

        if (val > this.max) {
          this.emitError(ERROR_TYPE.MAX);
          return 0;
        }

        if (typeof val !== 'number' || val !== val) {
          this.emitError(ERROR_TYPE.VALUE);
          return 0;
        }

        val = new Decimal(val).minus(this.min).divide(this.interval).toNumber();
      }

      var pos = new Decimal(val).multiply(this.gap).toNumber();
      return pos < 0 ? 0 : pos > 100 ? 100 : pos;
    }
    /**
     * Calculate the value by position
     *
     * @param {number} pos
     * @returns {Value}
     * @memberof Control
     */

  }, {
    key: "parsePos",
    value: function parsePos(pos) {
      var index = Math.round(pos / this.gap);
      return this.getValueByIndex(index);
    }
    /**
     * Determine if the location is active
     *
     * @param {number} pos
     * @returns {boolean}
     * @memberof Control
     */

  }, {
    key: "isActiveByPos",
    value: function isActiveByPos(pos) {
      return this.processArray.some(function (_ref3) {
        var _ref4 = _slicedToArray(_ref3, 2),
            start = _ref4[0],
            end = _ref4[1];

        return pos >= start && pos <= end;
      });
    }
    /**
     * Get each value
     *
     * @returns {Value[]}
     * @memberof Control
     */

  }, {
    key: "getValues",
    value: function getValues() {
      if (this.data) {
        return this.data;
      } else {
        var values = [];

        for (var i = 0; i <= this.total; i++) {
          values.push(new Decimal(i).multiply(this.interval).plus(this.min).toNumber());
        }

        return values;
      }
    }
    /**
     * Calculate the distance of the range
     * @param range number
     */

  }, {
    key: "getRangeDir",
    value: function getRangeDir(range) {
      return range ? new Decimal(range).divide(new Decimal(this.data ? this.data.length - 1 : this.max).minus(this.data ? 0 : this.min).toNumber()).multiply(100).toNumber() : 100;
    }
  }, {
    key: "emitError",
    value: function emitError(type) {
      if (this.onError) {
        this.onError(type, ERROR_MSG[type]);
      }
    }
  }, {
    key: "processArray",
    get: function get() {
      if (this.process) {
        if (typeof this.process === 'function') {
          return this.process(this.dotsPos);
        } else if (this.dotsPos.length === 1) {
          return [[0, this.dotsPos[0]]];
        } else if (this.dotsPos.length > 1) {
          return [[Math.min.apply(Math, _toConsumableArray(this.dotsPos)), Math.max.apply(Math, _toConsumableArray(this.dotsPos))]];
        }
      }

      return [];
    }
    /**
     * The total number of values
     *
     * @type {number}
     * @memberof Control
     */

  }, {
    key: "total",
    get: function get() {
      var total = 0;

      if (this.data) {
        total = this.data.length - 1;
      } else {
        total = new Decimal(this.max).minus(this.min).divide(this.interval).toNumber();
      }

      if (total - Math.floor(total) !== 0) {
        this.emitError(ERROR_TYPE.INTERVAL);
        return 0;
      }

      return total;
    } // Distance between each value

  }, {
    key: "gap",
    get: function get() {
      return 100 / this.total;
    }
  }, {
    key: "minRangeDir",
    get: // The minimum distance between the two sliders
    function get() {
      if (this.cacheRangeDir[this.minRange]) {
        return this.cacheRangeDir[this.minRange];
      }

      return this.cacheRangeDir[this.minRange] = this.getRangeDir(this.minRange);
    } // Maximum distance between the two sliders

  }, {
    key: "maxRangeDir",
    get: function get() {
      if (this.cacheRangeDir[this.maxRange]) return this.cacheRangeDir[this.maxRange];
      return this.cacheRangeDir[this.maxRange] = this.getRangeDir(this.maxRange);
    }
  }, {
    key: "getDotRange",
    value: function getDotRange(index, key, defaultValue) {
      if (!this.dotOptions) {
        return defaultValue;
      }

      var option = Array.isArray(this.dotOptions) ? this.dotOptions[index] : this.dotOptions;
      return option && option[key] !== void 0 ? this.parseValue(option[key]) : defaultValue;
    }
    /**
     * Sliding range of each slider
     *
     * @type {Array<[number, number]>}
     * @memberof Control
     */

  }, {
    key: "valuePosRange",
    get: function get() {
      var _this6 = this;

      var dotsPos = this.dotsPos;
      var valuePosRange = [];
      dotsPos.forEach(function (pos, i) {
        valuePosRange.push([Math.max(_this6.minRange ? _this6.minRangeDir * i : 0, !_this6.enableCross ? dotsPos[i - 1] || 0 : 0, _this6.getDotRange(i, 'min', 0)), Math.min(_this6.minRange ? 100 - _this6.minRangeDir * (dotsPos.length - 1 - i) : 100, !_this6.enableCross ? dotsPos[i + 1] || 100 : 100, _this6.getDotRange(i, 'max', 100))]);
      });
      return valuePosRange;
    }
  }, {
    key: "dotsIndex",
    get: function get() {
      var _this7 = this;

      return this.dotsValue.map(function (val) {
        return _this7.getIndexByValue(val);
      });
    }
  }]);

  return Control;
}();


;// CONCATENATED MODULE: ./lib/utils/state.ts
function state_classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function state_defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function state_createClass(Constructor, protoProps, staticProps) { if (protoProps) state_defineProperties(Constructor.prototype, protoProps); if (staticProps) state_defineProperties(Constructor, staticProps); Object.defineProperty(Constructor, "prototype", { writable: false }); return Constructor; }

function state_defineProperty(obj, key, value) { if (key in obj) { Object.defineProperty(obj, key, { value: value, enumerable: true, configurable: true, writable: true }); } else { obj[key] = value; } return obj; }

var State = /*#__PURE__*/function () {
  function State(map) {
    state_classCallCheck(this, State);

    state_defineProperty(this, "map", void 0);

    state_defineProperty(this, "states", 0);

    this.map = map;
  }

  state_createClass(State, [{
    key: "add",
    value: function add(state) {
      this.states |= state;
    }
  }, {
    key: "delete",
    value: function _delete(state) {
      this.states &= ~state;
    }
  }, {
    key: "toggle",
    value: function toggle(state) {
      if (this.has(state)) {
        this.delete(state);
      } else {
        this.add(state);
      }
    }
  }, {
    key: "has",
    value: function has(state) {
      return !!(this.states & state);
    }
  }]);

  return State;
}();


// EXTERNAL MODULE: ./lib/styles/slider.scss
var slider = __webpack_require__(85);
;// CONCATENATED MODULE: ./node_modules/.pnpm/babel-loader@8.2.5_rb5fcebzp6kx3hqg3ucus54t3m/node_modules/babel-loader/lib/index.js!./node_modules/.pnpm/ts-loader@9.3.0_esqjcmzo5pizlbillhrxoayzsy/node_modules/ts-loader/index.js??clonedRuleSet-86.use[1]!./node_modules/.pnpm/vue-loader@17.0.0_webpack@5.72.0/node_modules/vue-loader/dist/index.js??ruleSet[0].use[0]!./lib/vue-slider.vue?vue&type=script&lang=ts
function vue_slidervue_type_script_lang_ts_toConsumableArray(arr) { return vue_slidervue_type_script_lang_ts_arrayWithoutHoles(arr) || vue_slidervue_type_script_lang_ts_iterableToArray(arr) || vue_slidervue_type_script_lang_ts_unsupportedIterableToArray(arr) || vue_slidervue_type_script_lang_ts_nonIterableSpread(); }

function vue_slidervue_type_script_lang_ts_nonIterableSpread() { throw new TypeError("Invalid attempt to spread non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."); }

function vue_slidervue_type_script_lang_ts_iterableToArray(iter) { if (typeof Symbol !== "undefined" && iter[Symbol.iterator] != null || iter["@@iterator"] != null) return Array.from(iter); }

function vue_slidervue_type_script_lang_ts_arrayWithoutHoles(arr) { if (Array.isArray(arr)) return vue_slidervue_type_script_lang_ts_arrayLikeToArray(arr); }

function _typeof(obj) { "@babel/helpers - typeof"; return _typeof = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function (obj) { return typeof obj; } : function (obj) { return obj && "function" == typeof Symbol && obj.constructor === Symbol && obj !== Symbol.prototype ? "symbol" : typeof obj; }, _typeof(obj); }

function vue_slidervue_type_script_lang_ts_ownKeys(object, enumerableOnly) { var keys = Object.keys(object); if (Object.getOwnPropertySymbols) { var symbols = Object.getOwnPropertySymbols(object); enumerableOnly && (symbols = symbols.filter(function (sym) { return Object.getOwnPropertyDescriptor(object, sym).enumerable; })), keys.push.apply(keys, symbols); } return keys; }

function vue_slidervue_type_script_lang_ts_objectSpread(target) { for (var i = 1; i < arguments.length; i++) { var source = null != arguments[i] ? arguments[i] : {}; i % 2 ? vue_slidervue_type_script_lang_ts_ownKeys(Object(source), !0).forEach(function (key) { vue_slidervue_type_script_lang_ts_defineProperty(target, key, source[key]); }) : Object.getOwnPropertyDescriptors ? Object.defineProperties(target, Object.getOwnPropertyDescriptors(source)) : vue_slidervue_type_script_lang_ts_ownKeys(Object(source)).forEach(function (key) { Object.defineProperty(target, key, Object.getOwnPropertyDescriptor(source, key)); }); } return target; }

function vue_slidervue_type_script_lang_ts_defineProperty(obj, key, value) { if (key in obj) { Object.defineProperty(obj, key, { value: value, enumerable: true, configurable: true, writable: true }); } else { obj[key] = value; } return obj; }

function vue_slidervue_type_script_lang_ts_slicedToArray(arr, i) { return vue_slidervue_type_script_lang_ts_arrayWithHoles(arr) || vue_slidervue_type_script_lang_ts_iterableToArrayLimit(arr, i) || vue_slidervue_type_script_lang_ts_unsupportedIterableToArray(arr, i) || vue_slidervue_type_script_lang_ts_nonIterableRest(); }

function vue_slidervue_type_script_lang_ts_nonIterableRest() { throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."); }

function vue_slidervue_type_script_lang_ts_unsupportedIterableToArray(o, minLen) { if (!o) return; if (typeof o === "string") return vue_slidervue_type_script_lang_ts_arrayLikeToArray(o, minLen); var n = Object.prototype.toString.call(o).slice(8, -1); if (n === "Object" && o.constructor) n = o.constructor.name; if (n === "Map" || n === "Set") return Array.from(o); if (n === "Arguments" || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return vue_slidervue_type_script_lang_ts_arrayLikeToArray(o, minLen); }

function vue_slidervue_type_script_lang_ts_arrayLikeToArray(arr, len) { if (len == null || len > arr.length) len = arr.length; for (var i = 0, arr2 = new Array(len); i < len; i++) { arr2[i] = arr[i]; } return arr2; }

function vue_slidervue_type_script_lang_ts_iterableToArrayLimit(arr, i) { var _i = arr == null ? null : typeof Symbol !== "undefined" && arr[Symbol.iterator] || arr["@@iterator"]; if (_i == null) return; var _arr = []; var _n = true; var _d = false; var _s, _e; try { for (_i = _i.call(arr); !(_n = (_s = _i.next()).done); _n = true) { _arr.push(_s.value); if (i && _arr.length === i) break; } } catch (err) { _d = true; _e = err; } finally { try { if (!_n && _i["return"] != null) _i["return"](); } finally { if (_d) throw _e; } } return _arr; }

function vue_slidervue_type_script_lang_ts_arrayWithHoles(arr) { if (Array.isArray(arr)) return arr; }









var SliderState = {
  None: 0,
  Drag: 1 << 1,
  Focus: 1 << 2
};
var DEFAULT_SLIDER_SIZE = 4;
/* harmony default export */ var vue_slidervue_type_script_lang_ts = ((0,external_commonjs_vue_commonjs2_vue_root_Vue_amd_vue_.defineComponent)({
  name: 'VueSlider',
  components: {
    VueSliderDot: vue_slider_dot,
    VueSliderMark: vue_slider_mark
  },
  emits: ['change', 'drag-start', 'dragging', 'drag-end', 'error', 'update:modelValue'],
  data: function data() {
    return {
      control: null,
      states: new State(SliderState),
      // The width of the component is divided into one hundred, the width of each one.
      scale: 1,
      // Currently dragged slider index
      focusDotIndex: 0
    };
  },
  props: {
    modelValue: {
      type: [Number, String, Array],
      default: 0
    },
    silent: {
      type: Boolean,
      default: false
    },
    direction: {
      type: String,
      default: 'ltr',
      validator: function validator(dir) {
        return ['ltr', 'rtl', 'ttb', 'btt'].indexOf(dir) > -1;
      }
    },
    width: {
      type: [Number, String]
    },
    height: {
      type: [Number, String]
    },
    // The size of the slider, optional [width, height] | size
    dotSize: {
      type: [Number, Array],
      default: 14
    },
    // whether or not the slider should be fully contained within its containing element
    contained: {
      type: Boolean,
      default: false
    },
    min: {
      type: Number,
      default: 0
    },
    max: {
      type: Number,
      default: 100
    },
    interval: {
      type: Number,
      default: 1
    },
    disabled: {
      type: Boolean,
      default: false
    },
    clickable: {
      type: Boolean,
      default: true
    },
    dragOnClick: {
      type: Boolean,
      default: false
    },
    duration: {
      type: Number,
      default: 0.5
    },
    data: {
      type: [Object, Array]
    },
    dataValue: {
      type: String,
      default: 'value'
    },
    dataLabel: {
      type: String,
      default: 'label'
    },
    lazy: {
      type: Boolean,
      default: false
    },
    tooltip: {
      type: String,
      default: 'active',
      validator: function validator(val) {
        return ['none', 'always', 'focus', 'hover', 'active'].indexOf(val) > -1;
      }
    },
    tooltipPlacement: {
      type: [String, Array],
      validator: function validator(val) {
        return (Array.isArray(val) ? val : [val]).every(function (val) {
          return ['top', 'right', 'bottom', 'left'].indexOf(val) > -1;
        });
      }
    },
    tooltipFormatter: {
      type: [String, Array, Function]
    },
    // Keyboard control
    useKeyboard: {
      type: Boolean,
      default: true
    },
    // Keyboard controlled hook function
    keydownHook: {
      // eslint-disable-next-line no-unused-vars
      type: Function
    },
    // Whether to allow sliders to cross, only in range mode
    enableCross: {
      type: Boolean,
      default: true
    },
    // Whether to fix the slider interval, only in range mode
    fixed: {
      type: Boolean,
      default: false
    },
    // Whether to sort values, only in range mode
    // When order is false, the parameters [minRange, maxRange, fixed, enableCross] are invalid
    // e.g. When order = false, [50, 30] will not be automatically sorted into [30, 50]
    order: {
      type: Boolean,
      default: true
    },
    // Minimum distance between sliders, only in range mode
    minRange: {
      type: Number
    },
    // Maximum distance between sliders, only in range mode
    maxRange: {
      type: Number
    },
    marks: {
      type: [Boolean, Object, Array, Function],
      default: false
    },
    process: {
      type: [Boolean, Function],
      default: true
    },
    zoom: {
      type: Number
    },
    // If the value is true , mark will be an independent value
    included: {
      type: Boolean
    },
    // If the value is true , dot will automatically adsorb to the nearest value
    adsorb: {
      type: Boolean
    },
    hideLabel: {
      type: Boolean
    },
    // Slider settings, multiple sliders can be distinguished by array type.
    dotOptions: {
      type: [Object, Array]
    },
    // Set custom attributes on the slider.
    dotAttrs: {
      type: Object
    },
    railStyle: {
      type: Object
    },
    processStyle: {
      type: Object
    },
    dotStyle: {
      type: Object
    },
    tooltipStyle: {
      type: Object
    },
    stepStyle: {
      type: Object
    },
    stepActiveStyle: {
      type: Object
    },
    labelStyle: {
      type: Object
    },
    labelActiveStyle: {
      type: Object
    }
  },
  computed: {
    isHorizontal: function isHorizontal() {
      return this.direction === 'ltr' || this.direction === 'rtl';
    },
    isReverse: function isReverse() {
      return this.direction === 'rtl' || this.direction === 'btt';
    },
    tailSize: function tailSize() {
      return getSize((this.isHorizontal ? this.height : this.width) || DEFAULT_SLIDER_SIZE);
    },
    containerClasses: function containerClasses() {
      return ['vue-slider', ["vue-slider-".concat(this.direction)], {
        'vue-slider-disabled': this.disabled
      }];
    },
    containerStyles: function containerStyles() {
      var _ref = Array.isArray(this.dotSize) ? this.dotSize : [this.dotSize, this.dotSize],
          _ref2 = vue_slidervue_type_script_lang_ts_slicedToArray(_ref, 2),
          dotWidth = _ref2[0],
          dotHeight = _ref2[1];

      var containerWidth = this.width ? getSize(this.width) : this.isHorizontal ? 'auto' : getSize(DEFAULT_SLIDER_SIZE);
      var containerHeight = this.height ? getSize(this.height) : this.isHorizontal ? getSize(DEFAULT_SLIDER_SIZE) : 'auto';
      return {
        padding: this.contained ? "".concat(dotHeight / 2, "px ").concat(dotWidth / 2, "px") : this.isHorizontal ? "".concat(dotHeight / 2, "px 0") : "0 ".concat(dotWidth / 2, "px"),
        width: containerWidth,
        height: containerHeight
      };
    },
    processArray: function processArray() {
      var _this = this;

      return this.control.processArray.map(function (_ref3, index) {
        var _objectSpread2;

        var _ref4 = vue_slidervue_type_script_lang_ts_slicedToArray(_ref3, 3),
            start = _ref4[0],
            end = _ref4[1],
            style = _ref4[2];

        if (start > end) {
          ;
          var _ref5 = [end, start];
          start = _ref5[0];
          end = _ref5[1];
        }

        var sizeStyleKey = _this.isHorizontal ? 'width' : 'height';
        return {
          start: start,
          end: end,
          index: index,
          style: vue_slidervue_type_script_lang_ts_objectSpread(vue_slidervue_type_script_lang_ts_objectSpread((_objectSpread2 = {}, vue_slidervue_type_script_lang_ts_defineProperty(_objectSpread2, _this.isHorizontal ? 'height' : 'width', '100%'), vue_slidervue_type_script_lang_ts_defineProperty(_objectSpread2, _this.isHorizontal ? 'top' : 'left', 0), vue_slidervue_type_script_lang_ts_defineProperty(_objectSpread2, _this.mainDirection, "".concat(start, "%")), vue_slidervue_type_script_lang_ts_defineProperty(_objectSpread2, sizeStyleKey, "".concat(end - start, "%")), vue_slidervue_type_script_lang_ts_defineProperty(_objectSpread2, "transitionProperty", "".concat(sizeStyleKey, ",").concat(_this.mainDirection)), vue_slidervue_type_script_lang_ts_defineProperty(_objectSpread2, "transitionDuration", "".concat(_this.animateTime, "s")), _objectSpread2), _this.processStyle), style)
        };
      });
    },
    dotBaseStyle: function dotBaseStyle() {
      var _ref6 = Array.isArray(this.dotSize) ? this.dotSize : [this.dotSize, this.dotSize],
          _ref7 = vue_slidervue_type_script_lang_ts_slicedToArray(_ref6, 2),
          dotWidth = _ref7[0],
          dotHeight = _ref7[1];

      var dotPos;

      if (this.isHorizontal) {
        dotPos = vue_slidervue_type_script_lang_ts_defineProperty({
          transform: "translate(".concat(this.isReverse ? '50%' : '-50%', ", -50%)"),
          WebkitTransform: "translate(".concat(this.isReverse ? '50%' : '-50%', ", -50%)"),
          top: '50%'
        }, this.direction === 'ltr' ? 'left' : 'right', '0');
      } else {
        dotPos = vue_slidervue_type_script_lang_ts_defineProperty({
          transform: "translate(-50%, ".concat(this.isReverse ? '50%' : '-50%', ")"),
          WebkitTransform: "translate(-50%, ".concat(this.isReverse ? '50%' : '-50%', ")"),
          left: '50%'
        }, this.direction === 'btt' ? 'bottom' : 'top', '0');
      }

      return vue_slidervue_type_script_lang_ts_objectSpread({
        width: "".concat(dotWidth, "px"),
        height: "".concat(dotHeight, "px")
      }, dotPos);
    },
    mainDirection: function mainDirection() {
      switch (this.direction) {
        case 'ltr':
          return 'left';

        case 'rtl':
          return 'right';

        case 'btt':
          return 'bottom';

        case 'ttb':
          return 'top';

        default:
          return 'left';
      }
    },
    tooltipDirections: function tooltipDirections() {
      var dir = this.tooltipPlacement || (this.isHorizontal ? 'top' : 'left');

      if (Array.isArray(dir)) {
        return dir;
      } else {
        return this.dots.map(function () {
          return dir;
        });
      }
    },
    dots: function dots() {
      var _this2 = this;

      return this.control.dotsPos.map(function (pos, index) {
        return vue_slidervue_type_script_lang_ts_objectSpread({
          pos: pos,
          index: index,
          value: _this2.control.dotsValue[index],
          focus: _this2.states.has(SliderState.Focus) && _this2.focusDotIndex === index,
          disabled: _this2.disabled,
          style: _this2.dotStyle
        }, (Array.isArray(_this2.dotOptions) ? _this2.dotOptions[index] : _this2.dotOptions) || {});
      });
    },
    animateTime: function animateTime() {
      if (this.states.has(SliderState.Drag)) {
        return 0;
      }

      return this.duration;
    },
    canSort: function canSort() {
      return this.order && !this.minRange && !this.maxRange && !this.fixed && this.enableCross;
    },
    sliderData: function sliderData() {
      var _this3 = this;

      if (this.isObjectArrayData(this.data)) {
        return this.data.map(function (obj) {
          return obj[_this3.dataValue];
        });
      } else if (this.isObjectData(this.data)) {
        return Object.keys(this.data);
      } else {
        return this.data;
      }
    },
    sliderMarks: function sliderMarks() {
      var _this4 = this;

      if (this.marks) {
        return this.marks;
      } else if (this.isObjectArrayData(this.data)) {
        return function (val) {
          var mark = {
            label: val
          };

          _this4.data.some(function (obj) {
            if (obj[_this4.dataValue] === val) {
              mark.label = obj[_this4.dataLabel];
              return true;
            }

            return false;
          });

          return mark;
        };
      } else if (this.isObjectData(this.data)) {
        return this.data;
      } else {
        return void 0;
      }
    },
    sliderTooltipFormatter: function sliderTooltipFormatter() {
      var _this5 = this;

      if (this.tooltipFormatter) {
        return this.tooltipFormatter;
      } else if (this.isObjectArrayData(this.data)) {
        return function (val) {
          var tooltipText = '' + val;

          _this5.data.some(function (obj) {
            if (obj[_this5.dataValue] === val) {
              tooltipText = obj[_this5.dataLabel];
              return true;
            }

            return false;
          });

          return tooltipText;
        };
      } else if (this.isObjectData(this.data)) {
        var data = this.data;
        return function (val) {
          return data[val];
        };
      } else {
        return void 0;
      }
    },
    // Slider value and component internal value are inconsistent
    isNotSync: function isNotSync() {
      var values = this.control.dotsValue;
      return Array.isArray(this.modelValue) ? this.modelValue.length !== values.length || this.modelValue.some(function (val, index) {
        return val !== values[index];
      }) : this.modelValue !== values[0];
    },

    /**
     * Get the drag range of the slider
     *
     * @private
     * @param {number} index slider index
     * @returns {[number, number]} range [start, end]
     * @memberof VueSlider
     */
    dragRange: function dragRange() {
      var prevDot = this.dots[this.focusDotIndex - 1];
      var nextDot = this.dots[this.focusDotIndex + 1];
      return [prevDot ? prevDot.pos : -Infinity, nextDot ? nextDot.pos : Infinity];
    }
  },
  watch: {
    modelValue: function modelValue() {
      if (this.control && !this.states.has(SliderState.Drag) && this.isNotSync) {
        this.control.setValue(this.modelValue);
      }
    }
  },
  methods: {
    isObjectData: function isObjectData(data) {
      return !!data && Object.prototype.toString.call(data) === '[object Object]';
    },
    isObjectArrayData: function isObjectArrayData(data) {
      return !!data && Array.isArray(data) && data.length > 0 && _typeof(data[0]) === 'object';
    },
    bindEvent: function bindEvent() {
      document.addEventListener('touchmove', this.dragMove, {
        passive: false
      });
      document.addEventListener('touchend', this.dragEnd, {
        passive: false
      });
      document.addEventListener('mousedown', this.blurHandle);
      document.addEventListener('mousemove', this.dragMove);
      document.addEventListener('mouseup', this.dragEnd);
      document.addEventListener('mouseleave', this.dragEnd);
      document.addEventListener('keydown', this.keydownHandle);
    },
    unbindEvent: function unbindEvent() {
      document.removeEventListener('touchmove', this.dragMove);
      document.removeEventListener('touchend', this.dragEnd);
      document.removeEventListener('mousedown', this.blurHandle);
      document.removeEventListener('mousemove', this.dragMove);
      document.removeEventListener('mouseup', this.dragEnd);
      document.removeEventListener('mouseleave', this.dragEnd);
      document.removeEventListener('keydown', this.keydownHandle);
    },
    setScale: function setScale() {
      this.scale = new Decimal(Math.floor(this.isHorizontal ? this.$el.offsetWidth : this.$el.offsetHeight)).multiply(this.zoom || 1).divide(100).toNumber();
    },
    initControl: function initControl() {
      var _this6 = this;

      this.control = new Control({
        value: this.modelValue,
        data: this.sliderData,
        enableCross: this.enableCross,
        fixed: this.fixed,
        max: this.max,
        min: this.min,
        interval: this.interval,
        minRange: this.minRange,
        maxRange: this.maxRange,
        order: this.order,
        marks: this.sliderMarks,
        included: this.included,
        process: this.process,
        adsorb: this.adsorb,
        dotOptions: this.dotOptions,
        onError: this.emitError
      });
      ['data', 'enableCross', 'fixed', 'max', 'min', 'interval', 'minRange', 'maxRange', 'order', 'marks', 'process', 'adsorb', 'included', 'dotOptions'].forEach(function (name) {
        _this6.$watch(name, function (val) {
          if (name === 'data' && Array.isArray(_this6.control.data) && Array.isArray(val) && _this6.control.data.length === val.length && val.every(function (item, index) {
            return item === _this6.control.data[index];
          })) {
            return false;
          }

          switch (name) {
            case 'data':
            case 'dataLabel':
            case 'dataValue':
              _this6.control.data = _this6.sliderData;
              break;

            case 'mark':
              _this6.control.marks = _this6.sliderMarks;
              break;

            default:
              ;
              _this6.control[name] = val;
          }

          if (['data', 'max', 'min', 'interval'].indexOf(name) > -1) {
            _this6.control.syncDotsPos();
          }
        });
      });
    },
    syncValueByPos: function syncValueByPos() {
      var values = this.control.dotsValue;

      if (this.isDiff(values, Array.isArray(this.modelValue) ? this.modelValue : [this.modelValue])) {
        var newValue = values.length === 1 ? values[0] : vue_slidervue_type_script_lang_ts_toConsumableArray(values);
        this.$emit('change', newValue, this.focusDotIndex);
        this.$emit('update:modelValue', newValue);
      }
    },
    isDiff: function isDiff(value1, value2) {
      return value1.length !== value2.length || value1.some(function (val, index) {
        return val !== value2[index];
      });
    },
    emitError: function emitError(type, message) {
      if (!this.silent) {
        console.error("[VueSlider error]: ".concat(message));
      }

      this.$emit('error', type, message);
    },
    dragStartOnProcess: function dragStartOnProcess(e) {
      if (this.dragOnClick) {
        this.setScale();
        var pos = this.getPosByEvent(e);
        var index = this.control.getRecentDot(pos);

        if (this.dots[index].disabled) {
          return;
        }

        this.dragStart(index);
        this.control.setDotPos(pos, this.focusDotIndex);

        if (!this.lazy) {
          this.syncValueByPos();
        }
      }
    },
    dragStart: function dragStart(index) {
      this.focusDotIndex = index;
      this.setScale();
      this.states.add(SliderState.Drag);
      this.states.add(SliderState.Focus);
      this.$emit('drag-start', this.focusDotIndex);
    },
    dragMove: function dragMove(e) {
      if (!this.states.has(SliderState.Drag)) {
        return false;
      }

      e.preventDefault();
      var pos = this.getPosByEvent(e);
      this.isCrossDot(pos);
      this.control.setDotPos(pos, this.focusDotIndex);

      if (!this.lazy) {
        this.syncValueByPos();
      }

      var value = this.control.dotsValue;
      this.$emit('dragging', value.length === 1 ? value[0] : vue_slidervue_type_script_lang_ts_toConsumableArray(value), this.focusDotIndex);
    },
    // If the component is sorted, then when the slider crosses, toggle the currently selected slider index
    isCrossDot: function isCrossDot(pos) {
      if (this.canSort) {
        var curIndex = this.focusDotIndex;
        var curPos = pos;

        if (curPos > this.dragRange[1]) {
          curPos = this.dragRange[1];
          this.focusDotIndex++;
        } else if (curPos < this.dragRange[0]) {
          curPos = this.dragRange[0];
          this.focusDotIndex--;
        }

        if (curIndex !== this.focusDotIndex) {
          var dotVm = this.$refs["dot-".concat(this.focusDotIndex)];

          if (dotVm && dotVm.$el) {
            dotVm.$el.focus();
          }

          this.control.setDotPos(curPos, curIndex);
        }
      }
    },
    dragEnd: function dragEnd(e) {
      var _this7 = this;

      if (!this.states.has(SliderState.Drag)) {
        return false;
      }

      setTimeout(function () {
        if (_this7.lazy) {
          _this7.syncValueByPos();
        }

        if (_this7.included && _this7.isNotSync) {
          _this7.control.setValue(_this7.modelValue);
        } else {
          // Sync slider position
          _this7.control.syncDotsPos();
        }

        _this7.states.delete(SliderState.Drag); // If useKeyboard is true, keep focus status after dragging


        if (!_this7.useKeyboard || 'targetTouches' in e) {
          _this7.states.delete(SliderState.Focus);
        }

        _this7.$emit('drag-end', _this7.focusDotIndex);
      });
    },
    blurHandle: function blurHandle(e) {
      if (!this.states.has(SliderState.Focus) || !this.$refs.container || this.$refs.container.contains(e.target)) {
        return false;
      }

      this.states.delete(SliderState.Focus);
    },
    clickHandle: function clickHandle(e) {
      if (!this.clickable || this.disabled) {
        return false;
      }

      if (this.states.has(SliderState.Drag)) {
        return;
      }

      this.setScale();
      var pos = this.getPosByEvent(e);
      this.setValueByPos(pos);
    },
    focus: function focus(dot) {
      var index = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : 0;
      if (dot.disabled) return;
      this.states.add(SliderState.Focus);
      this.focusDotIndex = index;
    },
    blur: function blur() {
      this.states.delete(SliderState.Focus);
    },
    getValue: function getValue() {
      var values = this.control.dotsValue;
      return values.length === 1 ? values[0] : values;
    },
    getIndex: function getIndex() {
      var indexes = this.control.dotsIndex;
      return indexes.length === 1 ? indexes[0] : indexes;
    },
    setValue: function setValue(value) {
      this.control.setValue(Array.isArray(value) ? vue_slidervue_type_script_lang_ts_toConsumableArray(value) : [value]);
      this.syncValueByPos();
    },
    setIndex: function setIndex(index) {
      var _this8 = this;

      var value = Array.isArray(index) ? index.map(function (n) {
        return _this8.control.getValueByIndex(n);
      }) : this.control.getValueByIndex(index);
      this.setValue(value);
    },
    setValueByPos: function setValueByPos(pos) {
      var _this9 = this;

      var index = this.control.getRecentDot(pos);

      if (this.disabled || this.dots[index].disabled) {
        return false;
      }

      this.focusDotIndex = index;
      this.control.setDotPos(pos, index);
      this.syncValueByPos();

      if (this.useKeyboard) {
        this.states.add(SliderState.Focus);
      }

      setTimeout(function () {
        if (_this9.included && _this9.isNotSync) {
          _this9.control.setValue(_this9.modelValue);
        } else {
          _this9.control.syncDotsPos();
        }
      });
    },
    keydownHandle: function keydownHandle(e) {
      var _this10 = this;

      if (!this.useKeyboard || !this.states.has(SliderState.Focus)) {
        return false;
      }

      var isInclude = this.included && this.marks;
      var handleFunc = getKeyboardHandleFunc(e, {
        direction: this.direction,
        max: isInclude ? this.control.markList.length - 1 : this.control.total,
        min: 0,
        hook: this.keydownHook
      });

      if (handleFunc) {
        e.preventDefault();
        var newIndex = -1;
        var pos = 0;

        if (isInclude) {
          this.control.markList.some(function (mark, index) {
            if (mark.value === _this10.control.dotsValue[_this10.focusDotIndex]) {
              newIndex = handleFunc(index);
              return true;
            }

            return false;
          });

          if (newIndex < 0) {
            newIndex = 0;
          } else if (newIndex > this.control.markList.length - 1) {
            newIndex = this.control.markList.length - 1;
          }

          pos = this.control.markList[newIndex].pos;
        } else {
          newIndex = handleFunc(this.control.getIndexByValue(this.control.dotsValue[this.focusDotIndex]));
          pos = this.control.parseValue(this.control.getValueByIndex(newIndex));
        }

        this.isCrossDot(pos);
        this.control.setDotPos(pos, this.focusDotIndex);
        this.syncValueByPos();
      }
    },
    getPosByEvent: function getPosByEvent(e) {
      return getPos(e, this.$el, this.isReverse, this.zoom)[this.isHorizontal ? 'x' : 'y'] / this.scale;
    },
    renderSlot: function renderSlot(name, data, defaultSlot) {
      var scopedSlot = this.$slots[name];
      return scopedSlot ? scopedSlot(data) : defaultSlot;
    }
  },
  created: function created() {
    this.initControl();
  },
  mounted: function mounted() {
    this.bindEvent();
  },
  beforeUnmount: function beforeUnmount() {
    this.unbindEvent();
  }
}));
;// CONCATENATED MODULE: ./lib/vue-slider.vue?vue&type=script&lang=ts
 
;// CONCATENATED MODULE: ./lib/vue-slider.vue




;
const vue_slider_exports_ = /*#__PURE__*/(0,exportHelper/* default */.Z)(vue_slidervue_type_script_lang_ts, [['render',render]])

/* harmony default export */ var vue_slider = (vue_slider_exports_);
;// CONCATENATED MODULE: ./lib/index.ts
/* tslint:disable:import-spacing */




vue_slider.VueSliderMark = vue_slider_mark;
vue_slider.VueSliderDot = vue_slider_dot;
/* harmony default export */ var lib = (vue_slider);

;// CONCATENATED MODULE: ./node_modules/.pnpm/@vue+cli-service@5.0.4_sass-loader@12.6.0/node_modules/@vue/cli-service/lib/commands/build/entry-lib.js


/* harmony default export */ var entry_lib = (lib);


}();
__webpack_exports__ = __webpack_exports__["default"];
/******/ 	return __webpack_exports__;
/******/ })()
;
});
//# sourceMappingURL=vue-slider-component.umd.js.map