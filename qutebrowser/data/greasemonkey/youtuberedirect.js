// ==UserScript==
// @description Redirects Youtube URLs to Invidio.us
// @name Invidious Redirect
// @namespace Backend
// @include http://www.youtube.com/*
// @include https://www.youtube.com/*
// @version 1.1
// @run-at document-start
// @grant none
// ==/UserScript==
var a = 0;
setInterval(function () {
	if (a === 0 && window.location.href.indexOf('watch?') > -1 && window.location.href.indexOf('list=WL') < 0) {
		a = '//hooktube.com/watch?' + window.parent.location.href.split('?')[1];
		window.location.replace(a);
	}
}, 10);
