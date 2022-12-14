/*!
 * Codebase - v3.0.0
 * @author pixelcave - https://pixelcave.com
 * Copyright (c) 2018
 */
 ! function(n) {
     var e = {};

     function t(r) {
         if (e[r]) return e[r].exports;
         var o = e[r] = {
             i: r,
             l: !1,
             exports: {}
         };
         return n[r].call(o.exports, o, o.exports, t), o.l = !0, o.exports
     }
     t.m = n, t.c = e, t.d = function(n, e, r) {
         t.o(n, e) || Object.defineProperty(n, e, {
             enumerable: !0,
             get: r
         })
     }, t.r = function(n) {
         "undefined" != typeof Symbol && Symbol.toStringTag && Object.defineProperty(n, Symbol.toStringTag, {
             value: "Module"
         }), Object.defineProperty(n, "__esModule", {
             value: !0
         })
     }, t.t = function(n, e) {
         if (1 & e && (n = t(n)), 8 & e) return n;
         if (4 & e && "object" == typeof n && n && n.__esModule) return n;
         var r = Object.create(null);
         if (t.r(r), Object.defineProperty(r, "default", {
                 enumerable: !0,
                 value: n
             }), 2 & e && "string" != typeof n)
             for (var o in n) t.d(r, o, function(e) {
                 return n[e]
             }.bind(null, o));
         return r
     }, t.n = function(n) {
         var e = n && n.__esModule ? function() {
             return n.default
         } : function() {
             return n
         };
         return t.d(e, "a", e), e
     }, t.o = function(n, e) {
         return Object.prototype.hasOwnProperty.call(n, e)
     }, t.p = "", t(t.s = 36)
 }({
     36: function(n, e, t) {
         n.exports = t(37)
     },
     37: function(n, e) {
         function t(n, e) {
             for (var t = 0; t < e.length; t++) {
                 var r = e[t];
                 r.enumerable = r.enumerable || !1, r.configurable = !0, "value" in r && (r.writable = !0), Object.defineProperty(n, r.key, r)
             }
         }
         var r = function() {
             function n() {
                 ! function(n, e) {
                     if (!(n instanceof e)) throw new TypeError("Cannot call a class as a function")
                 }(this, n)
             }
             var e, r, o;
             return e = n, o = [{
                 key: "barsRandomize",
                 value: function() {
                     jQuery(".js-bar-randomize").on("click", function(n) {
                         jQuery(n.currentTarget).parents(".block").find(".progress-bar").each(function(n, e) {
                             var t = jQuery(e),
                                 r = Math.floor(91 * Math.random() + 10);
                             t.css("width", r + "%"), jQuery(".progress-bar-label", t).html(r + "%")
                         })
                     })
                 }
             }, {
                 key: "sweetAlert2",
                 value: function() {
                     var n = swal.mixin({
                         buttonsStyling: !1,
                         confirmButtonClass: "btn btn-lg btn-alt-success m-5",
                         cancelButtonClass: "btn btn-lg btn-alt-danger m-5",
                         inputClass: "form-control"
                     });
                     jQuery(".js-swal-alert").on("click", function(e) {
                         n("Hi, this is a simple alert!")
                     }), jQuery(".js-swal-success").on("click", function(e) {
                         n("Success", "Everything updated perfectly!", "success")
                     }), jQuery(".js-swal-info").on("click", function(e) {
                         n("Info", "Just an informational modal!", "info")
                     }), jQuery(".js-swal-warning").on("click", function(e) {
                         n("Warning", "Something needs your attention!", "warning")
                     }), jQuery(".js-swal-error").on("click", function(e) {
                         n("Oops...", "Something went wrong!", "error")
                     }), jQuery(".js-swal-question").on("click", function(e) {
                         n("Question", "Are you sure?", "question")
                     }), jQuery(".js-swal-confirm").on("click", function(e) {
                         n({
                             title: "Are you sure?",
                             text: "You will not be able to recover this imaginary file!",
                             type: "warning",
                             showCancelButton: !0,
                             confirmButtonColor: "#d26a5c",
                             confirmButtonText: "Yes, delete it!",
                             html: !1,
                             preConfirm: function(n) {
                                 return new Promise(function(n) {
                                     setTimeout(function() {
                                         n()
                                     }, 50)
                                 })
                             }
                         }).then(function(e) {
                             e.value ? n("Deleted!", "Your imaginary file has been deleted.", "success") : "cancel" === e.dismiss && n("Cancelled", "Your imaginary file is safe :)", "error")
                         })
                     })
                 }
             }, {
                 key: "init",
                 value: function() {
                     this.barsRandomize(), this.sweetAlert2()
                 }
             }], (r = null) && t(e.prototype, r), o && t(e, o), n
         }();
         jQuery(function() {
             r.init()
         })
     }
 });
