// ==UserScript==
// @name        AmazonSmile Redirect
// @namespace   http://jdel.us
// @description Redirect Amazon to AmazonSmile
// @include     http://*.amazon.de/*
// @include     https://*.amazon.de/*
// @exclude     http://*.amazon.es/*
// @exclude     https://*.amazon.es/*
// @version     0.4
// @grant       none
// ==/UserScript==

var url = window.location.host;

if (url.match("smile.amazon") == null) {
    url = window.location.href;
    if  (url.match("//www.") != null){
        url = url.replace("//www.", "//smile.");
    } else if (url.match("//amazon.") != null){
        url = url.replace("//amazon.", "//smile.amazon.");
    } else {
    	return;
    }
    
    console.log(url);
    window.location.replace(url);
}
