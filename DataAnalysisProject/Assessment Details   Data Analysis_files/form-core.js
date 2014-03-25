<!DOCTYPE html>
<html lang="en-US">
<head>
<meta charset="utf-8" />
<title>Assessment Details | Data Analysis</title>
<link rel="stylesheet" href="https://dt5zaw6a98blc.cloudfront.net/site-static/8920ce8c2afac41a2d434a68a91563e53d2576b6/css/spark.main.css" />
<link rel="stylesheet" href="https://www.coursera.org/maestro/api/course/971332/course.css">
<link rel="icon" href="https://spark-public.s3.amazonaws.com/dataanalysis/static/images/favicon.ico" />
</head>

<body>
    <a href="#course-page-content" class="hidden">Skip Navigation</a>
    <div class="hidden">
        This page features MathJax technology to render mathematical formulae.
        If you are using a screen reader, please visit <a href="http://www.dessci.com/en/products/mathplayer/">MathPlayer</a> to download the plugin for your browser. Please note that this is an Internet Explorer-only plugin at this time.
    </div>

    <h1 class="hidden">Data Analysis</h1>

    <script>window.onerror = function(message, url, lineNum) {

  // First check the URL and line number of the error
  url = url || window.location.href;
  // 99% of the time, errors without line numbers arent due to our code,
  // they are due to third party plugins and browser extensions
  if (lineNum === undefined || lineNum == null) return;
  
  // Now figure out the actual error message
  // If it's an event, as triggered in several browsers
  if (message.target && message.type) {
    message = message.type;
  }
  if (!message.indexOf) {
    message = 'Non-string, non-event error: ' + (typeof message);
  }
  
  var errorDescrip = {
    message: message,
    script: url,
    line: lineNum,
    url: document.URL
  }
  
  var err = {
    key: 'page.error.javascript', 
    value: errorDescrip
  }
  
  window._204 = window._204 || [];
  window._204.push(err);
  
  window._gaq = window._gaq || [];
  window._gaq.push(err);
}</script>

<div class="course-topbar container-fluid" role="banner">

    <div class="row-fluid">

        <div class="span3">
          <a href="https://www.coursera.org/" class="course-topbar-logo" data-if-linkable="add-referrer"></a>
        </div>

        <div class="course-topbar-nav-container span9" style="float:right;">
            <h2 class="hidden">Top Navigation Bar</h2>

            <ul class="course-topbar-nav-list">
                <li class="course-topbar-nav-list-item">
                  <a href="https://www.coursera.org/courses" data-if-linkable="add-referrer">Courses</a>
                </li>

                
                <li class="course-topbar-nav-list-item"
                    tabindex="0" role="button" aria-haspopup="true" aria-expanded="false" aria-owns="course-topbar-my"
                    data-popup="#course-topbar-my" data-popup-bind-open="mouseenter" data-popup-close style="cursor:pointer;" data-popup-direction="se">
                                        <a data-user-id="1181045">
                        Daniel Siegle                        <i class="icon-caret-down"></i>
                    </a>
                </li>

                            </ul>
        </div>
    </div>

    <div id="course-topbar-aboutus" class="course-topbar-sublist">
        <a class="course-topbar-sublist-item" href="https://www.coursera.org/about/jobs" target="_new" data-if-linkable="add-referrer">Jobs</a>
        <a class="course-topbar-sublist-item" href="https://www.coursera.org/about/team" target="_new" data-if-linkable="add-referrer">Team</a>
        <a class="course-topbar-sublist-item" href="https://www.coursera.org/about/contact" target="_new" data-if-linkable="add-referrer">Contact Us</a>
        <a class="course-topbar-sublist-item" href="https://www.coursera.org/about/" target="_new" data-if-linkable="add-referrer">About Us</a>
    </div>

    <div id="course-topbar-my" class="course-topbar-sublist">
        <a class="course-topbar-sublist-item" href="https://www.coursera.org/" target="_new">My Courses</a>
        <a class="course-topbar-sublist-item" href="https://www.coursera.org/account/profile" target="_new">Profile</a>
        <a class="course-topbar-sublist-item" href="https://www.coursera.org/account/records" target="_new">Course Records</a>
        <a class="course-topbar-sublist-item" href="https://www.coursera.org/account/settings" target="_new">Settings</a>
                <a class="course-topbar-sublist-item" href="https://class.coursera.org/dataanalysis-002/class/preferences">Course Preferences</a>
        <a class="course-topbar-sublist-item" href="https://class.coursera.org/dataanalysis-002/auth/logout">Sign Out</a>
    </div>

</div>








<div class="course-topbanner-wrapper">
  <div class="course-topbanner">
    <div class="course-topbanner-university-logo">
      <a href="https://www.coursera.org/jhu" class="coursera-university-color" target="_blank" data-if-linkable="add-referrer" title="https://www.coursera.org/jhu">
        <img src="https://www.coursera.org/maestro/api/course/971332/university_logo" alt="jhu">
      </a>
    </div>

    
    <h1 class="course-topbanner-header">
      <a class="course-topbanner-name coursera-university-color" href="https://class.coursera.org/dataanalysis-002/class/index" data-if-linkable="modal-lock">
        Data Analysis      </a>
      <br>
      <span class="course-topbanner-instructor" style="">
        by Jeff Leek      </span>
    </h1>

  </div>
</div>

        <div class="container-fluid" style="position:relative;">
        <div class="row-fluid">
            <div id="course-page-sidebar" role="navigation">
                <div class="course-navbar-container">
	<a href="https://class.coursera.org/dataanalysis-002/class/index"
      >
	<img src="https://www.coursera.org//maestro/api/course/971332/logo" style="width: 205px;height: 116px;margin: -15px 0px 8px 1px; box-shadow: 0 1px 1px 0 rgba(0, 0, 0, 0.05);" alt="Course Home Page">
	</a>

	<div data-coursera-course-search-nav-widget class="input-append course-search-nav-box">
		<form class="form-inline minimized-search" method="get" action="https://class.coursera.org/dataanalysis-002/class/search" data-js-search-form>
			<label for="course-search-nav-input" class="accessible-text-for-reader">Search this course</label>
			<input id="course-search-nav-input" type="text" name="q" data-js-search-input>&nbsp;</input>
			<button class="btn icon-search" type="submit">
				<span class="accessible-text-for-reader">Search</span>
			</button>
		</form>
	</div>

<h2 class="hidden">Side Navigation Bar</h2>
<ul class="course-navbar-list">
		
	<li class="course-navbar-item">
								<a href="https://class.coursera.org/dataanalysis-002/class/index"  data-if-linkable="modal-lock,gray,lock-icon" class="coursera-university-color">
				
				Home							</a>
						</li>
	
		
	<li class="course-navbar-item">
								<a href="https://class.coursera.org/dataanalysis-002/lecture/index"  data-if-linkable="modal-lock,gray,lock-icon" class="coursera-university-color">
				
				Video Lectures							</a>
						</li>
	
		
	<li class="course-navbar-item">
								<a href="https://class.coursera.org/dataanalysis-002/forum/index"  data-if-linkable="modal-lock,gray,lock-icon" class="coursera-university-color">
				
				Discussion Forums							</a>
						</li>
	
		
	<li class="course-navbar-item">
								</li>
	
		
	<li class="course-navbar-item">
								<a href="https://class.coursera.org/dataanalysis-002/quiz/index"  data-if-linkable="modal-lock,gray,lock-icon" class="coursera-university-color">
				
				Quizzes							</a>
						</li>
	
		
	<li class="course-navbar-item">
								<a href="https://class.coursera.org/dataanalysis-002/human_grading/index"  data-if-linkable="modal-lock,gray,lock-icon" class="coursera-university-color">
				
				Data Analysis Assignments							</a>
						</li>
	
		
	<li class="course-navbar-item">
								</li>
	
		
	<li class="course-navbar-item">
								<a href="https://class.coursera.org/dataanalysis-002/wiki/view?page=courselogistics"  data-if-linkable="modal-lock,gray,lock-icon" class="coursera-university-color">
				
				Course Logistics							</a>
						</li>
	
		
	<li class="course-navbar-item">
								<a href="https://class.coursera.org/dataanalysis-002/wiki/view?page=syllabus"  data-if-linkable="modal-lock,gray,lock-icon" class="coursera-university-color">
				
				Syllabus							</a>
						</li>
	
		
	<li class="course-navbar-item">
								<a href="https://class.coursera.org/dataanalysis-002/wiki/view?page=aboutus"  data-if-linkable="modal-lock,gray,lock-icon" class="coursera-university-color">
				
				About Us							</a>
						</li>
	
	
		<li class="course-navbar-item">
		<a href="https://share.coursera.org/wiki/index.php/dataanalysis:Main" target="_blank" class="coursera-university-color" title="Open course wiki in new window">
			Course Wiki
			<span class="icon-share"></span>
		</a>
	</li>
		
		<li class="course-navbar-item">
		<a href="http://www.meetup.com/Coursera/" target="_blank" class="coursera-university-color">
			Join a Meetup
			<span class="icon-share"></span>
		</a>
	</li>
	
    </ul>

<ul style="list-style-type:none;margin-left: 10px;">
  <li><a href="http://help.coursera.org" class="coursera-university-color" target="_blank" title="Open help articles in new window"><i class="icon-question-sign"></i> Help Articles</a></li>
</ul>

<ul style="list-style-type:none;margin-left: 10px;">
		<li><a href="https://class.coursera.org/dataanalysis-002/forum/list?forum_id=10000" class="coursera-university-color"><i class="icon-comments"></i> Course Materials Errors</a></li>
	<li><a href="https://class.coursera.org/dataanalysis-002/forum/list?forum_id=10001" class="coursera-university-color"><i class="icon-comments"></i> Technical Issues</a></li>

</ul>

</div>
            </div>
            <div id="course-page-content" role="main">
                                <script type="text/javascript">
  window.Global = {
    userIsAdmin: false,
    userId: 1181045,

    // API base URL so that the Backbone knows what to call
    API_BASE_URL: 'https://class.coursera.org/dataanalysis-002/human_grading/api/',

    COURSE_BASE_URL: '//class.coursera.org/dataanalysis-002/',
    SITES_ASSETS_BASE_URL: 'https://dt5zaw6a98blc.cloudfront.net/site-static/8920ce8c2afac41a2d434a68a91563e53d2576b6/',

    humanGradingLinkHref: "https:\/\/class.coursera.org\/dataanalysis-002\/human_grading\/",
    humanGradingLinkText: "Peer Assessments",

    BACKBONE_BASE_URL: '//class.coursera.org/dataanalysis-002/human_grading/view/',
    BACKBONE_ROOT: '/dataanalysis-002/human_grading/view/',

    UPLOADABLE_BINARY_EXTENSIONS: [],
  };
</script>

<link href="https://d2wvvaown1ul17.cloudfront.net/site-static/8920ce8c2afac41a2d434a68a91563e53d2576b6/css/bootstrap.css" rel="stylesheet" type="text/css"/><link href="https://d2wvvaown1ul17.cloudfront.net/site-static/8920ce8c2afac41a2d434a68a91563e53d2576b6/css/hg.css" rel="stylesheet" type="text/css"/><div id="main" role="main"></div>            </div>
        </div>
    </div>
        
    
    <script src="https://dt5zaw6a98blc.cloudfront.net/site-static/8920ce8c2afac41a2d434a68a91563e53d2576b6/spark/spark.js"></script>

<script>window.onerror = function(message, url, lineNum) {

  // First check the URL and line number of the error
  url = url || window.location.href;
  // 99% of the time, errors without line numbers arent due to our code,
  // they are due to third party plugins and browser extensions
  if (lineNum === undefined || lineNum == null) return;
  
  // Now figure out the actual error message
  // If it's an event, as triggered in several browsers
  if (message.target && message.type) {
    message = message.type;
  }
  if (!message.indexOf) {
    message = 'Non-string, non-event error: ' + (typeof message);
  }
  
  var errorDescrip = {
    message: message,
    script: url,
    line: lineNum,
    url: document.URL
  }
  
  var err = {
    key: 'page.error.javascript', 
    value: errorDescrip
  }
  
  window._204 = window._204 || [];
  window._204.push(err);
  
  window._gaq = window._gaq || [];
  window._gaq.push(err);
}</script>
<script type="text/javascript">
    // SET UP THE MULTITRACKER
        window.logger = window.Log({level:"error"});
        var parts = location.host.split(".");
    while(parts.length > 2) { parts.shift(); }

    window.multitracker = window.MultiTracker({logger:window.logger});
    window.multitracker.register('204', window._204 = window._204 || []);
    window.multitracker.register('ga', window._gaq = window._gaq || [], 'google');

    // SET UP GA and 204
    window._gaq.push(['_setAccount', 'UA-28377374-1']);
    window._gaq.push(['_setDomainName', 'coursera.org']);
    window._gaq.push(['_setAllowLinker', true]);  
    window._gaq.push(['_trackPageview']);
    
    // configure 204 with the following settings
    window._204.push(["client", "spark"]);
    window._204.push(["user", 1181045]);
    window._204.push(["domain", "." + parts.join(".")]);

    // set off the first event
    window._204.push({key:"pageview", val:{}});

    // override our multitracker queues with the ga queue when it is ready
    (function() {
      var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
      ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
      var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
    
      ga.onload = ga.onreadystatechange = function() {
          ga.onreadystatechange = ga.onload = null;
          window.multitracker.get('ga').queue = window._gaq;
      };
    })();

    // override our multitracker queues with the 204 queue when it is ready
    (function() {
      var a = document.createElement('script'); a.type = 'text/javascript'; a.async = true;
      a.src = 'https://eventing.coursera.org/204.min.js';
      var s = document.getElementsByTagName('script')[0];
      s.parentNode.insertBefore(a, s);
      a.onload = a.onreadystatechange = function() {
          a.onreadystatechange = a.onload = null;
          window.multitracker.get('204').queue = window._204;
      };
    })();
</script>

<script>
  // Set up shared AB testing object
  (function() {
    window.ab = {};

    // we want to share the 204 session cookie with the AB session cookie...
    var sessionId = AB.makeSession("__204u", {expires:356, domain:"." + location.host});
        var debug = false;
    
    window.ab.user = window.AB(1181045, "user", {debug:debug, tracker:window.multitracker, logger:window.logger});
    window.ab.session = window.AB(sessionId, "session", {debug:debug, tracker:window.multitracker, logger:window.logger});

    if(window.CourseraABExperiments.user) {
        window.ab.user.addExperiments(window.CourseraABExperiments.user);
        window.ab.user.runExperimentsOn("body");
    }

    if(window.CourseraABExperiments.session) {
        window.ab.session.addExperiments(window.CourseraABExperiments.session);
        window.ab.session.runExperimentsOn("body");
    }
  })();
</script>


    <script>
      // Set up help widget
      (function() {
        $("[data-helpwidget]").each(function() {
            window.HelpWidget(this, {tracker: window.multitracker});
        });
       })();

        $("[data-readme]").each(function() {
            window.ReadMe(this);
        });
    </script>

    <script src="https://dt5zaw6a98blc.cloudfront.net/site-static/8920ce8c2afac41a2d434a68a91563e53d2576b6/spark/core/js/modal_focus.js" type="text/javascript"></script>
    <script src="https://dt5zaw6a98blc.cloudfront.net/site-static/8920ce8c2afac41a2d434a68a91563e53d2576b6/spark/core/js/get_query_parameters.js" type="text/javascript"></script>
    <script src="https://dt5zaw6a98blc.cloudfront.net/site-static/8920ce8c2afac41a2d434a68a91563e53d2576b6/spark/app/signature/js/signature_track.js" type="text/javascript"></script>
    <script src="https://dt5zaw6a98blc.cloudfront.net/site-static/8920ce8c2afac41a2d434a68a91563e53d2576b6/spark/app/signature/js/signatureTrackLastChanceModal.html.js" type="text/javascript"></script>
    <script src="https://dt5zaw6a98blc.cloudfront.net/site-static/8920ce8c2afac41a2d434a68a91563e53d2576b6/spark/app/generic/js/item_list.js" type="text/javascript"></script>
    <script src="https://dt5zaw6a98blc.cloudfront.net/site-static/8920ce8c2afac41a2d434a68a91563e53d2576b6/spark/app/generic/js/navbar.js" type="text/javascript"></script>

    
    <script>
     // Set up help widget
      (function() {
        $("[data-helpwidget]").each(function() {
            window.HelpWidget(this, {tracker: window.multitracker});
        });
       })();
    </script>

        <script>
    (function() {
        $("<style type='text/css'> .coursera-reporter-link { display:inline-block;} </style>").appendTo("head");
    })();
    </script>
    
    <script type="text/x-mathjax-config">
MathJax.Hub.Config({
  config: ["MMLorHTML.js"],
  
  styleSheets: [],
  styles: {},

  jax: ["input/TeX"],
  
  extensions: ["tex2jax.js"],

  preJax: null,
  postJax: null,

  preRemoveClass: "MathJax_Preview",

  showProcessingMessages: true,

  messageStyle: "none",
  
  displayAlign: "center",
  displayIndent: "0em",
  
  delayStartupUntil: "none",

  skipStartupTypeset: false,
  
  elements: [],
  
  tex2jax: {
	    inlineMath: [
	                 ['$$','$$'],      // uncomment this for standard TeX math delimiters
	                 ['\\(','\\)']
	                 ],

	                 displayMath: [
	                 ['\\[','\\]']
	                 ],

    skipTags: ["script","noscript","style","textarea","pre","code"],
    ignoreClass: "tex2jax_ignore",
    processClass: "tex2jax_process",
    processEscapes: false,
    processEnvironments: true,
    preview: "TeX"
    
  },
  
  mml2jax: {
    preview: "alttext"
    
  },
  
  jsMath2jax: {
    preview: "TeX"
    
  },

  TeX: {
    TagSide: "right",
    TagIndent: ".8em",
    MultLineWidth: "85%",
    Macros: {},

    extensions: ["AMSmath.js", "AMSsymbols.js"]
    
  },

  //============================================================================
  //
  //  These parameters control the MathML inupt jax.
  //
  MathML: {
    //
    //  This specifies whether to use TeX spacing or MathML spacing when the
    //  HTML-CSS output jax is used.
    //
    useMathMLspacing: false
  },
  
  //============================================================================
  //
  //  These parameters control the HTML-CSS output jax.
  //
  "HTML-CSS": {
    
    scale: 100,
    
    availableFonts: ["STIX","TeX"],
    
    preferredFont: "TeX",
    
    webFont: "TeX",
    
    imageFont: "TeX",
    
    undefinedFamily: "STIXGeneral,'Arial Unicode MS',serif",
      
    showMathMenu: true,

    styles: {},
    
    tooltip: {
      delayPost: 600,          // milliseconds delay before tooltip is posted after mouseover
      delayClear: 600,         // milliseconds delay before tooltip is cleared after mouseout
      offsetX: 10, offsetY: 5  // pixels to offset tooltip from mouse position
    }
  },
  
  //============================================================================
  //
  //  These parameters control the NativeMML output jax.
  //
  NativeMML: {

    scale: 100,

    showMathMenu: true,
    showMathMenuMSIE: true,

    styles: {}
  },
  
  MathMenu: {
    delay: 400,
    
    helpURL: "http://www.mathjax.org/help/user/",

    showRenderer: true,
    showFontMenu: false,
    showContext:  false,

    windowSettings: {
      status: "no", toolbar: "no", locationbar: "no", menubar: "no",
      directories: "no", personalbar: "no", resizable: "yes", scrollbars: "yes",
      width: 100, height: 50
    },
    
    styles: {}
    
  },

  MMLorHTML: {
    prefer: {
      MSIE:    "MML",
      Firefox: "MML",
      Opera:   "HTML",
      other:   "HTML"
    }
  }
});
</script>
<script type="text/javascript">
(function () {

  function loadMathJax() {
    var script = document.createElement("script");
    script.type = "text/javascript";
    script.src  = "https://duqnjvq4jwr55.cloudfront.net/2.1/MathJax.js";
    document.getElementsByTagName("head")[0].appendChild(script);
  }

  window.loadOrRefreshMathJax = function(domId) {
    if (window.MathJax) {
      if (domId) {
        MathJax.Hub.Queue(["Typeset", MathJax.Hub, domId]);
      } else {
        MathJax.Hub.Queue(["Typeset", MathJax.Hub]);
      }
    } else {
      loadMathJax();
    }
  }
})();
</script>
    <script type="text/javascript">
        var site_base_url = "https:\/\/www.coursera.org\/";
        var site_static_asset_url = "https:\/\/dt5zaw6a98blc.cloudfront.net\/site-static\/";
        var spark_class_short_name = "dataanalysis";
        var spark_class_id = 971332;
        var spark_class_url = "\/dataanalysis-002";
        var spark_signature_url = "https:\/\/class.coursera.org\/dataanalysis-002\/signature\/";

        var course_strings_name = "Data Analysis";
        var student_full_name = "Daniel Siegle";
    </script>

    
<script type="text/javascript" src="https://d2wvvaown1ul17.cloudfront.net/site-static/8920ce8c2afac41a2d434a68a91563e53d2576b6/pages/hg/thirdparty/webshims/extras/modernizr-custom.js"></script><script type="text/javascript" src="https://d2wvvaown1ul17.cloudfront.net/site-static/8920ce8c2afac41a2d434a68a91563e53d2576b6/js/core/require.js"></script><script data-baseurl="https://d2wvvaown1ul17.cloudfront.net/site-static/8920ce8c2afac41a2d434a68a91563e53d2576b6/" data-assets="https://d2wvvaown1ul17.cloudfront.net/site-static/" data-version="8920ce8c2afac41a2d434a68a91563e53d2576b6" data-timestamp='1383694406986' data-debug='0' id="hg-require" type="text/javascript">(function(el) {
  // Prevent throw
  require.onError = function(err) {
    window._204 = window._204 || [];
    window._204.push({key: 'requireErr', value: err});
  };
  
  // Load 204
  require.config({
    context: "204js",
    paths: {
      "_204": "https://eventing.coursera.org/204.min"
    },
    urlArgs: "client=hg.client&user=" + window.Global.userId
  })(["_204"], function(_204) {
    window._204 = _204;
  });
  
  require.config({
    paths: {
      // Libraries
      jquery                   : "js/core/jquery",
      handlebars               : "pages/hg/thirdparty/js/handlebars", // For hbs.js, supports AMD
      underscore               : "js/core/underscore",
      i18n                     : "js/core/i18n._t",
      
      // Backbone & extensions
      backbone                 : "pages/hg/thirdparty/js/backbone",
      deepmodel                : "pages/hg/thirdparty/js/backbone.deepmodel",
      marionette               : "pages/hg/thirdparty/js/backbone.marionette",
      modelbinding             : "pages/hg/thirdparty/js/backbone.modelbinding", // supports AMD
      
      // jQuery plugins
      webshims                 : "pages/hg/thirdparty/webshims/polyfiller", // for HTML5 inputs, e.g. "number"
      webshims_mousepress      : "pages/hg/thirdparty/webshims/extras/mousepress", // for improved spinner
      jqueryresize             : "pages/hg/thirdparty/js/jquery.ba-resize.min",
      throttle                 : "pages/hg/thirdparty/js/jquery.throttle",
      'jquery.ui.widget'       : "js/lib/jquery.ui.widget",
      'jquery.livetimer'       : "js/lib/jquery.livetimer",
      'jquery.linkify'         : "js/lib/jquery.linkify",
      
      // Bootstrap & plugins
      bootstrap                : "pages/hg/thirdparty/js/bootstrap/bootstrap.min",
      bootstrap_alert          : "pages/hg/thirdparty/js/bootstrap/alert",
      bootstrap_tooltip        : "js/lib/bootstrap.tooltip",
      bootstrap_transition     : "pages/hg/thirdparty/js/bootstrap/transition",
      bootstrap_tab            : "pages/hg/thirdparty/js/bootstrap/tab",
      bootstrap_popover        : "js/lib/bootstrap.popover",
      
      // Coursera libraries
      SignatureAuthModal       : "spark/app/signature/js/launch_iframe",
      SignatureGeneralModal    : "spark/app/signature/js/general_sigtrack_modal"
    },
    shim: {
      underscore: {
        exports: "_"
      },
      backbone: {
        deps: ["jquery", "underscore"],
        exports: "Backbone"
      },
      deepmodel: {
        deps: ["backbone"]
      },
      marionette: {
        deps: ["backbone"]
      },
      webshims: {
        deps: ["jquery"]
      },
      webshims_mousepress: {
        deps: ["jquery", "webshims"]
      },
      jqueryresize: {
        deps: ["jquery"]
      },
      throttle: {
        deps: ["jquery"]
      },
      'jquery.linkify': {
        deps: ["jquery"]
      },
      bootstrap_alert: {
        deps: ["jquery", "bootstrap_transition"]
      },
      bootstrap_tooltip: {
        deps: ["jquery"]
      },
      bootstrap_transition: {
        deps: ["jquery"]
      },
      bootstrap_tab: {
        deps: ["jquery"]
      }
    },
    //enforceDefine: true,
    waitSeconds: 14,
    baseUrl: el.getAttribute("data-baseurl"),
    urlArgs: el.getAttribute("data-debug") == "1" ? "v=" + el.getAttribute("data-timestamp") : "",
    callback: function() {
      require(["pages/hg/js/app/hg"]);
    }
  });
})(document.getElementById("hg-require"));</script>

</body>

</html>
