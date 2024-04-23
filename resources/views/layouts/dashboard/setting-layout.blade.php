<x-dashboard.dashboard-layout title="true">

     <div class="content-body">
          <div class="container">
              <div class="row">
                 <x-dashboard.setting-sidebar />
                 {{ $slot }}
              </div>
          </div>
      </div>


</x-dashboard.dashboard-layout>