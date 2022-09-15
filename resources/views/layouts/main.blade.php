
<!doctype html>
<html lang="en" class="no-focus">
    <head>
      @include('partials._head')
    </head>
    <body>
      <!-- Slide Left Modal -->
              <div class="modal fade" id="modal-slideleft" tabindex="-1" role="dialog" aria-labelledby="modal-slideleft" aria-hidden="true">
                  <div class="modal-dialog modal-dialog-slideleft" role="document">
                      <div class="modal-content">
                        <div class="block block-themed block22" >
                                  <div class="block-header bg-info">
                                      <h3 class="block-title">Changer de mot de passe</h3>
                                  </div>
                                  <div class="block-content">
                                      <form  id="resetPassword">
                                        {!! csrf_field() !!}
                                          <div class="form-group row">
                                              <div class="col-8 offset-2">
                                                  <div class="form-material input-group">
                                                      <input type="password" class="form-control" id="mdpActuel" name="mdpActuel" placeholder="Enter your email..">
                                                      <label for="mdpActuel">Mot de Passe Actuel</label>
                                                      <div class="input-group-append">
                                                          <span class="input-group-text">
                                                              <i class="si si-lock fa-2x"></i>
                                                          </span>
                                                      </div>
                                                  </div>
                                              </div>
                                          </div>
                                          <div class="form-group row">
                                              <div class="col-8 offset-2">
                                                  <div class="form-material input-group">
                                                      <input type="password" class="form-control" id="mdpNew" name="mdpNew" placeholder="Enter your email..">
                                                      <label for="mdpNew">Nouveau Mot de passe</label>
                                                      <div class="input-group-append">
                                                          <span class="input-group-text">
                                                              <i class="si si-lock fa-2x"></i>
                                                          </span>
                                                      </div>
                                                  </div>
                                              </div>
                                          </div>

                                          <div class="form-group row">
                                              <div class="col-8 offset-2">
                                                  <div class="form-material input-group">
                                                      <input type="password" class="form-control" id="mdpNew_confirmation" name="mdpNew_confirmation" placeholder="Enter your email..">
                                                      <label for="mdpNew_confirmation">Confirmation mot de passe</label>
                                                      <div class="input-group-append">
                                                          <span class="input-group-text">
                                                              <i class="si si-lock fa-2x"></i>
                                                          </span>
                                                      </div>
                                                  </div>
                                              </div>
                                          </div>

                                          <div class="form-group row">
                                              <div class="col-12">
                                                  <button type="submit" class="btn btn-alt-info">
                                                      <i class="fa fa-send mr-5"></i> Enregitrer
                                                  </button>
                                              </div>
                                          </div>
                                      </form>
                                  </div>
                              </div>

                      </div>
                  </div>
              </div>
              <!-- END Slide Left Modal -->

        <!-- Page Container -->
        <!--
            Available classes for #page-container:

        GENERIC

            'enable-cookies'                            Remembers active color theme between pages (when set through color theme helper Template._uiHandleTheme())

        SIDEBAR & SIDE OVERLAY

            'sidebar-r'                                 Right Sidebar and left Side Overlay (default is left Sidebar and right Side Overlay)
            'sidebar-mini'                              Mini hoverable Sidebar (screen width > 991px)
            'sidebar-o'                                 Visible Sidebar by default (screen width > 991px)
            'sidebar-o-xs'                              Visible Sidebar by default (screen width < 992px)
            'sidebar-inverse'                           Dark themed sidebar

            'side-overlay-hover'                        Hoverable Side Overlay (screen width > 991px)
            'side-overlay-o'                            Visible Side Overlay by default

            'enable-page-overlay'                       Enables a visible clickable Page Overlay (closes Side Overlay on click) when Side Overlay opens

            'side-scroll'                               Enables custom scrolling on Sidebar and Side Overlay instead of native scrolling (screen width > 991px)

        HEADER

            ''                                          Static Header if no class is added
            'page-header-fixed'                         Fixed Header

        HEADER STYLE

            ''                                          Classic Header style if no class is added
            'page-header-modern'                        Modern Header style
            'page-header-inverse'                       Dark themed Header (works only with classic Header style)
            'page-header-glass'                         Light themed Header with transparency by default
                                                        (absolute position, perfect for light images underneath - solid light background on scroll if the Header is also set as fixed)
            'page-header-glass page-header-inverse'     Dark themed Header with transparency by default
                                                        (absolute position, perfect for dark images underneath - solid dark background on scroll if the Header is also set as fixed)

        MAIN CONTENT LAYOUT

            ''                                          Full width Main Content if no class is added
            'main-content-boxed'                        Full width Main Content with a specific maximum width (screen width > 1200px)
            'main-content-narrow'                       Full width Main Content with a percentage width (screen width > 1200px)
        -->
        <div id="page-container" class="enable-cookies sidebar-mini sidebar-o enable-page-overlay side-scroll page-header-modern main-content-boxed">
            <!-- Side Overlay-->
            <aside id="side-overlay">
              @include('partials._right')
            </aside>
            <!-- END Side Overlay -->

            <!-- Sidebar -->
            <!--
                Helper classes

                Adding .sidebar-mini-hide to an element will make it invisible (opacity: 0) when the sidebar is in mini mode
                Adding .sidebar-mini-show to an element will make it visible (opacity: 1) when the sidebar is in mini mode
                    If you would like to disable the transition, just add the .sidebar-mini-notrans along with one of the previous 2 classes

                Adding .sidebar-mini-hidden to an element will hide it when the sidebar is in mini mode
                Adding .sidebar-mini-visible to an element will show it only when the sidebar is in mini mode
                    - use .sidebar-mini-visible-b if you would like to be a block when visible (display: block)
            -->
            <nav id="sidebar">
                <!-- Sidebar Content -->
                @include('partials._left')
                <!-- Sidebar Content -->
            </nav>
            <!-- END Sidebar -->

            <!-- Header -->
            @include('partials._header')
            <!-- END Header -->

            <!-- Main Container -->
            <main id="main-container">

                <!-- Page Content -->
                @yield('content')
                <!-- END Page Content -->

            </main>
            <!-- END Main Container -->

            <!-- Footer -->
            @include('partials._footer')
            <!-- END Footer -->
        </div>
        <!-- END Page Container -->
        @include('partials._javascript')
    </body>
</html>
