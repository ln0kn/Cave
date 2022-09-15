<!--
Codebase JS Core

Vital libraries and plugins used in all pages. You can choose to not include this file if you would like
to handle those dependencies through webpack. Please check out _es6/main/bootstrap.js for more info.

If you like, you could also include them separately directly from the js/core folder in the following
order. That can come in handy if you would like to include a few of them (eg jQuery) from a CDN.

js/core/jquery.min.js
js/core/bootstrap.bundle.min.js
js/core/simplebar.min.js
js/core/jquery-scrollLock.min.js
js/core/jquery.appear.min.js
js/core/jquery.countTo.min.js
js/core/js.cookie.min.js
-->
<script src="js/codebase.core.min.js"></script>


<!--
Codebase JS

Custom functionality including Blocks/Layout API as well as other vital and optional helpers
webpack is putting everything together at _es6/main/app.js
-->
<script src="js/codebase.app.min.js"></script>

<script src="js/lib/plus.js"></script>
<script src="js/lib/one.js"></script>

<!-- <script src="js/plugins/select2/js/select2.full.min.js"></script> -->
<script src="js/plugins/jquery-validation/jquery.validate.min.js"></script>
<script src="js/plugins/jquery-validation/additional-methods.js"></script>

<script src="js/plugins/bootstrap-notify/bootstrap-notify.min.js"></script>
<!-- <script src="js/plugins/es6-promise/es6-promise.auto.min.js"></script> -->
<!-- <script src="js/pages/be_ui_activity.js"></script> -->

<!-- Page JS Plugins -->
<script src="js/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="js/plugins/datatables/dataTables.bootstrap4.min.js"></script>
<script src="js/plugins/datatables/dataTables.responsive.min.js"></script>
<!-- <script src="lib/datatables.net-responsive/js/dataTables.responsive.min.js"></script> -->
<!-- Page JS Code -->
<!-- <script src="js/pages/be_tables_datatables.min.js"></script> -->




<script src="js/pages/be_forms_validation.js"></script>
<script src="js/plugins/jquery-validation/localization/messages_fr.js"></script>


@yield('script')

<script>jQuery(function(){ Codebase.helpers(['notify','content-filter']); });</script>
