<div class="sidebar-content">
  <!-- Side Header -->
  <div class="content-header content-header-fullrow px-15">
    <!-- Mini Mode -->
    <div class="content-header-section sidebar-mini-visible-b">
      <!-- Logo -->
      <span class="content-header-item font-w700 font-size-xl float-left animated fadeIn">
        <span class="text-dual-primary-dark">w</span><span class="text-primary">s</span>
      </span>
      <!-- END Logo -->
    </div>
    <!-- END Mini Mode -->

    <!-- Normal Mode -->
    <div class="content-header-section text-center align-parent sidebar-mini-hidden">
      <!-- Close Sidebar, Visible only on mobile screens -->
      <!-- Layout API, functionality initialized in Template._uiApiLayout() -->
      <button type="button" class="btn btn-circle btn-dual-secondary d-lg-none align-v-r" data-toggle="layout" data-action="sidebar_close">
        <i class="fa fa-times text-danger"></i>
      </button>
      <!-- END Close Sidebar -->

      <!-- Logo -->
      <div class="content-header-item">
        <a class="link-effect font-w700" href="/home">
          <i class="si si-fire text-primary"></i>
          <span class="font-size-xl text-dual-primary-dark">wend</span><span class="font-size-xl text-primary"> som</span>
        </a>
      </div>
      <!-- END Logo -->
    </div>
    <!-- END Normal Mode -->
  </div>
  <!-- END Side Header -->

  <!-- Side User -->
  <a class="block block-link-pop bg-gd-dusk text-center" href="javascript:void(0)">
    <div class="block-content block-content-full">
      <img class="img-avatar img-avatar-thumb" src='{{Auth::user()-> enrolle -> sexeEnrolle == 0 ? "media/avatars/u2.png" : "media/avatars/u9.png"}}' alt="">
    </div>
    <div class="block-content block-content-full bg-black-op-5">
      <div class="font-w600 text-white mb-5">{{Auth::user()->enrolle -> nomEnrolle }} {{Auth::user() -> enrolle -> prenomEnrolle }}</div>
      <div class="font-size-sm text-white-op">{{Auth::user()-> enrolle -> poste -> designationPostes  }}</div>
    </div>
    <div class="block-content block-content-full block-content-sm">
      <span class="font-w600 font-size-sm text-info-light">{{Auth::user()->email }}</span>
    </div>
  </a>

  <!-- END Side User -->

  <!-- Side Navigation -->
  <div class="content-side content-side-full">
    <ul class="nav-main">

      <li class="nav-main-heading"><span class="sidebar-mini-visible">MU</span><span class="sidebar-mini-hidden">MENU</span></li>
      <li>
        <a href="/Ventes"><i class="si si-wallet fa-2x"></i><span class="sidebar-mini-hide">Ventes</span></a>
      </li>
      <li>
        <a href="register"><i class="fa fa-users"></i><span class="sidebar-mini-hide">Utilisateur</span></a>
      </li>
      <li>
        <a href="/Approvissionnements"><i class="fa fa-cart-plus fa-2x"></i><span class="sidebar-mini-hide">Approvissionnements</span></a>
      </li>
      <li>
        <a href="/Remises"><i class="fa fa-sort-amount-desc fa-2x"></i><span class="sidebar-mini-hide">Remises</span></a>
      </li>
      <li>
        <a href="/Clients"><i class="fa fa-address-book-o fa-2x"></i><span class="sidebar-mini-hide">Clients</span></a>
      </li>
      <li>
        <a href="/Fournisseurs"><i class="si si-badge"></i><span class="sidebar-mini-hide">Fournisseurs</span></a>
      </li>
      <li>
        <a href="/Enrollements"><i class="fa fa-user-plus fa-2x"></i><span class="sidebar-mini-hide">Enrollement</span></a>
      </li>
      <li>
        <a href="/Produits"><i class="si si-book-open"></i><span class="sidebar-mini-hide">Produits</span></a>
      </li>
      <li>
        <a href="/Statistiques"><i class="fa fa-line-chart"></i><span class="sidebar-mini-hide">Statistique</span></a>
      </li>

      <li>
        <a href="/Autres"><i class="si si-docs fa-2x"></i><span class="sidebar-mini-hide">Autres</span></a>
      </li>
      <li>
        <a href="/Stocks"><i class="si si-basket-loaded fa-2x"></i><span class="sidebar-mini-hide">Stocks</span></a>
      </li>





    </ul>
  </div>
  <!-- END Side Navigation -->
</div>
