<div class="col-xl-12">
   <div class="card sub-menu">
      <div class="card-body active">
         <ul class="d-flex show">
            <li class="nav-item">
               <a href="{{ route('profile.index') }}" class="nav-link {{ is_current_route(['profile.index','profile.edit'],'active') }}">
                  <i class="mdi mdi-account-settings-variant"></i>
                  <span>{{ __('Profile') }}</span>
               </a>
            </li>
            <li class="nav-item">
               <a href="{{ route('preference.index') }}" class="nav-link {{ is_current_route(['preference.index','preference.edit'],'active') }}">
                  <i class="mdi mdi-settings"></i>
                  <span>{{ __('Preference') }}</span>
               </a>
            </li>
            <li class="nav-item">
               <a href="{{ route('profile.change-password') }}" class="nav-link {{ is_current_route('profile.change-password','active') }}">
                  <i class="mdi mdi-lock"></i>
                  <span>{{ __('Change Password') }}</span>
               </a>
            </li>
            <li class="nav-item">
               <a href="{{ route('profile.google-2fa.create') }}" class="nav-link {{ is_current_route('profile.google-2fa.create') }}">
                  <i class="mdi mdi-bank"></i>
                  <span>{{ __('Google 2FA') }}</span>
               </a>
            </li>
            @if (settings('enable_kyc_verification_in_exchange'))
            <li class="nav-item">
               <a href="{{ route('kyc-verifications.index') }}" class="nav-link {{ is_current_route('kyc-verifications.index') }}">
                  <i class="mdi mdi-bank"></i>
                  <span>{{ __('KYC Verification') }}</span>
               </a>
            </li>
            @endif
            <li class="nav-item">
               <a href="{{ route('referral.link.show') }}" class="nav-link {{ is_current_route(['referral.link.show'],'active') }}">
                  <i class="mdi mdi-bank"></i>
                  <span>{{ __('Referral Link') }}</span>
               </a>
            </li>
         </ul>
      </div>
   </div>
</div>
