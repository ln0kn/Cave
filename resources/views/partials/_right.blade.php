<!-- Side Header -->
<div class="content-header content-header-fullrow">
    <div class="content-header-section align-parent">
        <!-- Close Side Overlay -->
        <!-- Layout API, functionality initialized in Template._uiApiLayout() -->
        <button type="button" class="btn btn-circle btn-dual-secondary align-v-r" data-toggle="layout" data-action="side_overlay_close">
            <i class="fa fa-times text-danger"></i>
        </button>
        <!-- END Close Side Overlay -->

        <!-- User Info -->
        <div class="content-header-item">
            <a class="img-link mr-5" href="be_pages_generic_profile.html">
                <img class="img-avatar img-avatar32" src="media/avatars/avatar15.jpg" alt="">
            </a>
            <a class="align-middle link-effect text-primary-dark font-w600" href="/home">{{Auth::user()->enrolle -> nomEnrolle }} {{Auth::user() -> enrolle -> prenomEnrolle }}</a>
        </div>
        <!-- END User Info -->
    </div>
</div>
<!-- END Side Header -->

<!-- Side Content -->
<div class="content-side">

    <!-- Friends -->
    <div class="block my-block2 pull-r-l">
        <div class="block-header bg-body-light">
            <h3 class="block-title"><i class="fa fa-fw fa-users font-size-default mr-5"></i>État du stock</h3>
            <div class="block-options">
                <button type="button" class="btn-block-option" data-toggle="block-option" data-action="state_toggle" data-action-mode="demo">
                    <i class="si si-refresh"></i>
                </button>
                <button type="button" class="btn-block-option" data-toggle="block-option" data-action="content_toggle"></button>
            </div>
        </div>
        <div class="block-content " id="plus">

        </div>
    </div>
    <!-- END Friends -->

</div>
<!-- END Side Content -->
