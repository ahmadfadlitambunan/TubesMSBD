<ul class="navbar-nav bg-gradient-success sidebar sidebar-dark accordion" id="accordionSidebar">

    <!-- Sidebar - Brand -->
   
    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="">
        <div class="sidebar-brand-icon rotate-n-15">
            <i class="fas fw fa-money-bill"></i>
        </div>
        <div class="sidebar-brand-text mx-3">GYM Fit</sup></div>
    </a>

    <!-- Divider -->
    <hr class="sidebar-divider my-0">

    <!-- Nav Item - Dashboard -->
    <li class="nav-item active">
        <a class="nav-link" href="/siswa">
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>Dashboard</span>
        </a>
    </li>

    <li class="nav-item">
        <a class="nav-link" href="/berita">
            <i class="fas fw fa-newspaper"></i>
            <span>Berita</span></a>
    </li>


    {{-- Level User Admin --}}
    <!-- Divider -->
    <hr class="sidebar-divider">
    <!-- Heading -->
    <div class="sidebar-heading">
        Management
    </div>
    <!-- Nav Item - Pages Collapse Menu -->
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true"
            aria-controls="collapseTwo">
            <i class="fas fa-fw fa-database"></i>
            <span>Pengelolaan Data</span>
        </a>
        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <a class="collapse-item" href="#">Admin</a>
                <a class="collapse-item" href="#">Membership</a>
                <a class="collapse-item" href="#">Equipment</a>
                <a class="collapse-item" href="#">Training</a>
                <a class="collapse-item" href="#">invoice</a>
                <a class="collapse-item" href="#">Jenis Pembayaran</a>
                <a class="collapse-item" href="#">Metode Pembayaran</a>
            </div>
        </div>
    </li>

    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseThree" aria-expanded="true"
            aria-controls="collapse">
            <i class="fas fa-fw fa-database"></i>
            <span>Workout</span>
        </a>
        <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <a class="collapse-item" href="#">Workout Training</a>
                <a class="collapse-item" href="#">Workout Body Area</a>
                <a class="collapse-item" href="#">Workkout Equipment</a>
            </div>
        </div>
    </li>

    <!-- Nav Item - Utilities Collapse Menu -->
    <li class="nav-item">
        <a class="nav-link" href="#">
            <i class="fas fa-fw fa-clipboard-check"></i>
            <span>Verifikasi Pembayaran</span></a>
    </li>

    <!-- Divider -->
    <hr class="sidebar-divider d-none d-md-block">

    <!-- Sidebar Toggler (Sidebar) -->
    <div class="text-center d-none d-md-inline mb-auto">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
    </div>

</ul>