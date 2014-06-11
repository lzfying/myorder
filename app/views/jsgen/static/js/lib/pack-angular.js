//angular-locale_zh-cn.js
angular.module("ngLocale",[],["$provide",function(a){a.value("$locale",{DATETIME_FORMATS:{AMPMS:["\u4e0a\u5348","\u4e0b\u5348"],DAY:"\u661f\u671f\u65e5 \u661f\u671f\u4e00 \u661f\u671f\u4e8c \u661f\u671f\u4e09 \u661f\u671f\u56db \u661f\u671f\u4e94 \u661f\u671f\u516d".split(" "),MONTH:"1\u6708 2\u6708 3\u6708 4\u6708 5\u6708 6\u6708 7\u6708 8\u6708 9\u6708 10\u6708 11\u6708 12\u6708".split(" "),SHORTDAY:"\u5468\u65e5 \u5468\u4e00 \u5468\u4e8c \u5468\u4e09 \u5468\u56db \u5468\u4e94 \u5468\u516d".split(" "),
SHORTMONTH:"1\u6708 2\u6708 3\u6708 4\u6708 5\u6708 6\u6708 7\u6708 8\u6708 9\u6708 10\u6708 11\u6708 12\u6708".split(" "),fullDate:"y\u5e74M\u6708d\u65e5EEEE",longDate:"y\u5e74M\u6708d\u65e5",medium:"yyyy-M-d ah:mm:ss",mediumDate:"yyyy-M-d",mediumTime:"ah:mm:ss","short":"yy-M-d ah:mm",shortDate:"yy-M-d",shortTime:"ah:mm"},NUMBER_FORMATS:{CURRENCY_SYM:"\u00a5",DECIMAL_SEP:".",GROUP_SEP:",",PATTERNS:[{gSize:3,lgSize:3,macFrac:0,maxFrac:3,minFrac:0,minInt:1,negPre:"-",negSuf:"",posPre:"",posSuf:""},
{gSize:3,lgSize:3,macFrac:0,maxFrac:2,minFrac:2,minInt:1,negPre:"(\u00a4",negSuf:")",posPre:"\u00a4",posSuf:""}]},id:"zh-cn",pluralCat:function(a){return"other"}})}]);

// angular-route.min.js
(function(q,c,I){'use strict';function x(c,f){return m(new (m(function(){},{prototype:c})),f)}function t(c,f,a,p,n){return{restrict:"ECA",terminal:!0,priority:1E3,transclude:"element",compile:function(g,m,D){return function(u,m,e){function g(){k&&(k.$destroy(),k=null);l&&(n.leave(l),l=null)}function s(){var h=c.current&&c.current.locals,y=h&&h.$template;if(y){var z=u.$new();D(z,function(d){g();d.html(y);n.enter(d,null,m);var G=a(d.contents()),r=c.current;k=r.scope=z;l=d;if(r.controller){h.$scope=
k;var e=p(r.controller,h);r.controllerAs&&(k[r.controllerAs]=e);d.data("$ngControllerController",e);d.contents().data("$ngControllerController",e)}G(k);k.$emit("$viewContentLoaded");k.$eval(b);f()})}else g()}var k,l,b=e.onload||"";u.$on("$routeChangeSuccess",s);s()}}}}var A=c.copy,H=c.equals,m=c.extend,w=c.forEach,v=c.isDefined,B=c.isFunction,C=c.isString;q=c.module("ngRoute",["ng"]).provider("$route",function(){function c(a,p){var f=p.caseInsensitiveMatch,g={originalPath:a,regexp:a},m=g.keys=[];
a=a.replace(/([().])/g,"\\$1").replace(/(\/)?:(\w+)([\?|\*])?/g,function(a,c,p,e){a="?"===e?e:null;e="*"===e?e:null;m.push({name:p,optional:!!a});c=c||"";return""+(a?"":c)+"(?:"+(a?c:"")+(e&&"(.+)?"||"([^/]+)?")+")"+(a||"")}).replace(/([\/$\*])/g,"\\$1");g.regexp=RegExp("^"+a+"$",f?"i":"");return g}var f={};this.when=function(a,p){f[a]=m({reloadOnSearch:!0},p,a&&c(a,p));if(a){var n="/"==a[a.length-1]?a.substr(0,a.length-1):a+"/";f[n]=m({redirectTo:a},c(n,p))}return this};this.otherwise=function(a){this.when(null,
a);return this};this.$get=["$rootScope","$location","$routeParams","$q","$injector","$http","$templateCache","$sce",function(a,c,n,g,s,q,u,t){function e(){var b=E(),h=l.current;if(b&&h&&b.$$route===h.$$route&&H(b.pathParams,h.pathParams)&&!b.reloadOnSearch&&!k)h.params=b.params,A(h.params,n),a.$broadcast("$routeUpdate",h);else if(b||h)k=!1,a.$broadcast("$routeChangeStart",b,h),(l.current=b)&&b.redirectTo&&(C(b.redirectTo)?c.path(F(b.redirectTo,b.params)).search(b.params).replace():c.url(b.redirectTo(b.pathParams,
c.path(),c.search())).replace()),g.when(b).then(function(){if(b){var a=m({},b.resolve),c,d;w(a,function(b,c){a[c]=C(b)?s.get(b):s.invoke(b)});v(c=b.template)?B(c)&&(c=c(b.params)):v(d=b.templateUrl)&&(B(d)&&(d=d(b.params)),d=t.getTrustedResourceUrl(d),v(d)&&(b.loadedTemplateUrl=d,c=q.get(d,{cache:u}).then(function(b){return b.data})));v(c)&&(a.$template=c);return g.all(a)}}).then(function(c){b==l.current&&(b&&(b.locals=c,A(b.params,n)),a.$broadcast("$routeChangeSuccess",b,h))},function(c){b==l.current&&
a.$broadcast("$routeChangeError",b,h,c)})}function E(){var b,a;w(f,function(e,k){var d;if(d=!a){var f=c.path();d=e.keys;var r={};if(e.regexp)if(f=e.regexp.exec(f)){for(var g=1,l=f.length;g<l;++g){var n=d[g-1],q="string"==typeof f[g]?decodeURIComponent(f[g]):f[g];n&&q&&(r[n.name]=q)}d=r}else d=null;else d=null;d=b=d}d&&(a=x(e,{params:m({},c.search(),b),pathParams:b}),a.$$route=e)});return a||f[null]&&x(f[null],{params:{},pathParams:{}})}function F(b,c){var a=[];w((b||"").split(":"),function(b,d){if(0===
d)a.push(b);else{var e=b.match(/(\w+)(.*)/),f=e[1];a.push(c[f]);a.push(e[2]||"");delete c[f]}});return a.join("")}var k=!1,l={routes:f,reload:function(){k=!0;a.$evalAsync(e)}};a.$on("$locationChangeSuccess",e);return l}]});q.provider("$routeParams",function(){this.$get=function(){return{}}});q.directive("ngView",t);t.$inject=["$route","$anchorScroll","$compile","$controller","$animate"]})(window,window.angular);

//angular-resource.min.js
(function(H,g,C){'use strict';var A=g.$$minErr("$resource");g.module("ngResource",["ng"]).factory("$resource",["$http","$parse","$q",function(D,y,E){function n(g,h){this.template=g;this.defaults=h||{};this.urlParams={}}function u(l,h,d){function p(c,b){var e={};b=v({},h,b);q(b,function(a,b){t(a)&&(a=a());var m;a&&a.charAt&&"@"==a.charAt(0)?(m=a.substr(1),m=y(m)(c)):m=a;e[b]=m});return e}function b(c){return c.resource}function e(c){z(c||{},this)}var F=new n(l);d=v({},G,d);q(d,function(c,f){var h=
/^(POST|PUT|PATCH)$/i.test(c.method);e[f]=function(a,f,m,l){var d={},r,s,w;switch(arguments.length){case 4:w=l,s=m;case 3:case 2:if(t(f)){if(t(a)){s=a;w=f;break}s=f;w=m}else{d=a;r=f;s=m;break}case 1:t(a)?s=a:h?r=a:d=a;break;case 0:break;default:throw A("badargs",arguments.length);}var n=r instanceof e,k=n?r:c.isArray?[]:new e(r),x={},u=c.interceptor&&c.interceptor.response||b,y=c.interceptor&&c.interceptor.responseError||C;q(c,function(a,c){"params"!=c&&("isArray"!=c&&"interceptor"!=c)&&(x[c]=z(a))});
x.data=r;F.setUrlParams(x,v({},p(r,c.params||{}),d),c.url);d=D(x).then(function(a){var b=a.data,f=k.$promise;if(b){if(g.isArray(b)!=!!c.isArray)throw A("badcfg",c.isArray?"array":"object",g.isArray(b)?"array":"object");c.isArray?(k.length=0,q(b,function(a){k.push(new e(a))})):(z(b,k),k.$promise=f)}k.$resolved=!0;(s||B)(k,a.headers);a.resource=k;return a},function(a){k.$resolved=!0;(w||B)(a);return E.reject(a)}).then(u,y);return n?d:(k.$promise=d,k.$resolved=!1,k)};e.prototype["$"+f]=function(a,c,
b){t(a)&&(b=c,c=a,a={});a=e[f](a,this,c,b);return a.$promise||a}});e.bind=function(c){return u(l,v({},h,c),d)};return e}var G={get:{method:"GET"},save:{method:"POST"},query:{method:"GET",isArray:!0},remove:{method:"DELETE"},"delete":{method:"DELETE"}},B=g.noop,q=g.forEach,v=g.extend,z=g.copy,t=g.isFunction;n.prototype={setUrlParams:function(l,h,d){var p=this,b=d||p.template,e,n,c=p.urlParams={};q(b.split(/\W/),function(f){!/^\d+$/.test(f)&&(f&&RegExp("(^|[^\\\\]):"+f+"(\\W|$)").test(b))&&(c[f]=!0)});
b=b.replace(/\\:/g,":");h=h||{};q(p.urlParams,function(c,d){e=h.hasOwnProperty(d)?h[d]:p.defaults[d];g.isDefined(e)&&null!==e?(n=encodeURIComponent(e).replace(/%40/gi,"@").replace(/%3A/gi,":").replace(/%24/g,"$").replace(/%2C/gi,",").replace(/%20/g,"%20").replace(/%26/gi,"&").replace(/%3D/gi,"=").replace(/%2B/gi,"+"),b=b.replace(RegExp(":"+d+"(\\W|$)","g"),n+"$1")):b=b.replace(RegExp("(/?):"+d+"(\\W|$)","g"),function(a,c,b){return"/"==b.charAt(0)?b:c+b})});b=b.replace(/\/+$/,"");b=b.replace(/\/\.(?=\w+($|\?))/,
".");l.url=b.replace(/\/\\\./,"/.");q(h,function(c,b){p.urlParams[b]||(l.params=l.params||{},l.params[b]=c)})}};return u}])})(window,window.angular);

//angular-cookies.min.js
(function(p,f,n){'use strict';f.module("ngCookies",["ng"]).factory("$cookies",["$rootScope","$browser",function(d,b){var c={},g={},h,k=!1,l=f.copy,m=f.isUndefined;b.addPollFn(function(){var a=b.cookies();h!=a&&(h=a,l(a,g),l(a,c),k&&d.$apply())})();k=!0;d.$watch(function(){var a,e,d;for(a in g)m(c[a])&&b.cookies(a,n);for(a in c)(e=c[a],f.isString(e))?e!==g[a]&&(b.cookies(a,e),d=!0):f.isDefined(g[a])?c[a]=g[a]:delete c[a];if(d)for(a in e=b.cookies(),c)c[a]!==e[a]&&(m(e[a])?delete c[a]:c[a]=e[a])});
return c}]).factory("$cookieStore",["$cookies",function(d){return{get:function(b){return(b=d[b])?f.fromJson(b):b},put:function(b,c){d[b]=f.toJson(c)},remove:function(b){delete d[b]}}}])})(window,window.angular);

//angular-animate.min.js
(function(C,n,D){'use strict';n.module("ngAnimate",["ng"]).config(["$provide","$animateProvider",function(A,t){var u=n.noop,v=n.forEach,B=t.$$selectors,p="$$ngAnimateState",z={running:!0};A.decorator("$animate",["$delegate","$injector","$sniffer","$rootElement","$timeout","$rootScope",function(r,n,t,g,m,h){function w(a){if(a){var e=[],d={};a=a.substr(1).split(".");a.push("");for(var b=0;b<a.length;b++){var s=a[b],f=B[s];f&&!d[s]&&(e.push(n.get(f)),d[s]=!0)}return e}}function f(a,e,d,b,f,h){function n(a){v(a,
function(a){(a.endFn||u)(!0)})}function c(){c.hasBeenRun||(c.hasBeenRun=!0,d.removeData(p),(h||u)())}var l=(" "+((d.attr("class")||"")+" "+e)).replace(/\s+/g,"."),k=[];v(w(l),function(c,d){k.push({start:c[a]})});b||(b=f?f.parent():d.parent());f={running:!0};(b.inheritedData(p)||f).running?m(h||u,0,!1):(b=d.data(p)||{},b.running&&(n(b.animations),b.done()),d.data(p,{running:!0,animations:k,done:c}),v(k,function(b,f){var l=function(){a:{k[f].done=!0;(k[f].endFn||u)();for(var a=0;a<k.length;a++)if(!k[a].done)break a;
c()}};b.start?b.endFn="addClass"==a||"removeClass"==a?b.start(d,e,l):b.start(d,l):l()}))}g.data(p,z);return{enter:function(a,e,d,b){r.enter(a,e,d);h.$$postDigest(function(){f("enter","ng-enter",a,e,d,function(){b&&m(b,0,!1)})})},leave:function(a,e){h.$$postDigest(function(){f("leave","ng-leave",a,null,null,function(){r.leave(a,e)})})},move:function(a,e,d,b){r.move(a,e,d);h.$$postDigest(function(){f("move","ng-move",a,null,null,function(){b&&m(b,0,!1)})})},addClass:function(a,e,d){f("addClass",e,a,
null,null,function(){r.addClass(a,e,d)})},removeClass:function(a,e,d){f("removeClass",e,a,null,null,function(){r.removeClass(a,e,d)})},enabled:function(a){arguments.length&&(z.running=!a);return!z.running}}}]);t.register("",["$window","$sniffer","$timeout",function(r,p,u){function g(c,l,k){function q(a){var c=0;a=n.isString(a)?a.split(/\s*,\s*/):[];h(a,function(a){c=Math.max(parseFloat(a)||0,c)});return c}if(p.transitions||p.animations){if(-1==["ng-enter","ng-leave","ng-move"].indexOf(l)){var g=0;
h(c,function(a){a.nodeType==v&&(a=r.getComputedStyle(a)||{},g=Math.max(q(a[f+d]),q(a[e+d]),g))});if(0<g){k();return}}c.addClass(l);var m=0;h(c,function(c){if(c.nodeType==v){c=r.getComputedStyle(c)||{};var l=Math.max(q(c[f+b]),q(c[e+b])),k=Math.max(q(c[w+b]),q(c[a+b])),h=Math.max(q(c[f+d]),q(c[e+d])),g=Math.max(q(c[w+d]),q(c[a+d]));0<g&&(g*=Math.max(parseInt(c[w+t])||0,parseInt(c[a+t])||0,1));m=Math.max(k+g,l+h,m)}});if(0<m){var x=c[0];x.style[f+s]="none";x.style[e+s]="none";var y="";h(l.split(" "),
function(a,c){y+=(0<c?" ":"")+a+"-active"});c.prop("clientWidth");x.style[f+s]="";x.style[e+s]="";c.addClass(y);u(k,1E3*m,!1);return function(a){c.removeClass(l);c.removeClass(y);a&&k()}}c.removeClass(l)}k()}function m(a,d){var b="";a=n.isArray(a)?a:a.split(/\s+/);h(a,function(a,c){a&&0<a.length&&(b+=(0<c?" ":"")+a+d)});return b}var h=n.forEach,w="animation",f="transition",a=p.vendorPrefix+"Animation",e=p.vendorPrefix+"Transition",d="Duration",b="Delay",s="Property",t="IterationCount",v=1;return{enter:function(a,
b){return g(a,"ng-enter",b)},leave:function(a,b){return g(a,"ng-leave",b)},move:function(a,b){return g(a,"ng-move",b)},addClass:function(a,b,d){return g(a,m(b,"-add"),d)},removeClass:function(a,b,d){return g(a,m(b,"-remove"),d)}}}])}])})(window,window.angular);

//angular-ui.js
angular.module("ui.validate",[]).directive("uiValidate",function(){return{restrict:"A",require:"ngModel",link:function(e,a,b,d){var c,g={};if(a=e.$eval(b.uiValidate))angular.isString(a)&&(a={validator:a}),angular.forEach(a,function(b,f){c=function(a){var c=e.$eval(b,{$value:a});if(angular.isObject(c)&&angular.isFunction(c.then))return c.then(function(){d.$setValidity(f,!0)},function(){d.$setValidity(f,!1)}),a;if(c)return d.$setValidity(f,!0),a;d.$setValidity(f,!1)};g[f]=c;d.$formatters.push(c);d.$parsers.push(c)}),
b.uiValidateWatch&&(b=e.$eval(b.uiValidateWatch),angular.isString(b)?e.$watch(b,function(){angular.forEach(g,function(a,b){a(d.$modelValue)})}):angular.forEach(b,function(a,b){e.$watch(a,function(){g[b](d.$modelValue)})}))}}});
