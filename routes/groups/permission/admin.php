<?php

use App\Http\Controllers\BankAccount\AdminBankManagementController;
use App\Http\Controllers\BankAccount\ChangeAdminBankAccountStatusController;
use App\Http\Controllers\BankAccount\AdminUserBankManagementController;
use App\Http\Controllers\Core\{AdminUserSearchController,
    ApplicationSettingController,
    LanguageController,
    NavigationController,
    NoticesController,
    RoleController,
    UsersController
};
use App\Http\Controllers\Dashboard\AdminDashboardController;
use App\Http\Controllers\Deposit\AdminBankDepositAdjustController;
use App\Http\Controllers\Deposit\AdminBankDepositReviewController;
use App\Http\Controllers\Deposit\AdminDepositHistoryController;
use App\Http\Controllers\Deposit\AdminEthereumDepositHistoryController;
use App\Http\Controllers\Deposit\AdminBinanceDepositHistoryController;
use App\Http\Controllers\Deposit\AdminUserDepositController;
use App\Http\Controllers\Deposit\SystemDepositController;
use App\Http\Controllers\Stake\AdminUserStakeController;
use App\Http\Controllers\Bonus\AdminUserBonusController;
use App\Http\Controllers\KycManagement\AdminKycController;
use App\Http\Controllers\KycManagement\ApproveKycVerificationController;
use App\Http\Controllers\KycManagement\DeclineKycVerificationController;
use App\Http\Controllers\KycManagement\ExpiredKycVerificationController;
use App\Http\Controllers\NodeStatusController;
use App\Http\Controllers\Orders\AdminUserOpenOrderController;
use App\Http\Controllers\Page\AdminDynamicContentController;
use App\Http\Controllers\Page\AdminPageController;
use App\Http\Controllers\Page\AdminVisualEditController;
use App\Http\Controllers\Post\ChangePostCategoryStatusController;
use App\Http\Controllers\Post\ChangePostStatusController;
use App\Http\Controllers\Post\PostCategoryController;
use App\Http\Controllers\Post\PostCommentController;
use App\Http\Controllers\Post\ChangeCommentStatusController;
use App\Http\Controllers\Post\PostController;
use App\Http\Controllers\Post\ReplyCommentController;
use App\Http\Controllers\Ticket\AdminTicketController;
use App\Http\Controllers\TradeHistory\AdminUserTradeHistoryController;
use App\Http\Controllers\UserActivity\AdminActivityController;
use App\Http\Controllers\Wallet\AdjustAmountController;
use App\Http\Controllers\Wallet\AdminUserWalletController;
use App\Http\Controllers\Wallet\SystemWalletsController;
use App\Http\Controllers\Withdrawal\AdminUserWithdrawalController;
use App\Http\Controllers\Withdrawal\AdminWithdrawalHistoryController;
use App\Http\Controllers\Withdrawal\AdminWithdrawalReviewController;
use App\Http\Controllers\Withdrawal\SystemWithdrawalController;
use App\Http\Controllers\IDO\AdminStageController;
use App\Http\Controllers\IDO\AdminStagePricingController;
use App\Http\Controllers\IDO\AdminStageBonusController;
use App\Http\Controllers\IDO\AdminStageIconOptionController;
use App\Http\Controllers\IDO\PaymentMethodController;
use Illuminate\Support\Facades\Route;
use Rap2hpoutre\LaravelLogViewer\LogViewerController;

Route::group(['prefix' => 'admin'], function () {
    //Dashboard
    Route::get('/dashboard', [AdminDashboardController::class, 'index'])
        ->name('admin.dashboard');
    Route::get('/dashboard/get-featured-coins', [AdminDashboardController::class, 'getFeaturedCoins'])
        ->name('admin.dashboard.get-featured-coins');
    Route::get('/dashboard/get-recent-register-users', [AdminDashboardController::class, 'getRecentRegisterUsers'])
        ->name('admin.dashboard.get-recent-register-users');
    Route::get('/dashboard/get-coin-pair-trade', [AdminDashboardController::class, 'getCoinPairTrade'])
        ->name('admin.dashboard.get-coin-pair-trade');
    Route::get('/dashboard/get-recent-withdrawals', [AdminDashboardController::class, 'getRecentWithdrawals'])
        ->name('admin.dashboard.get-recent-withdrawals');
    Route::get('/dashboard/get-recent-deposits', [AdminDashboardController::class, 'getRecentDeposits'])
        ->name('admin.dashboard.get-recent-deposits');
    Route::get('/dashboard/get-recent-trades', [AdminDashboardController::class, 'getRecentTrades'])
        ->name('admin.dashboard.get-recent-trades');
    Route::get('/dashboard/user-reports', [AdminDashboardController::class, 'getUserReports'])
        ->name('admin.dashboard.get-user-reports');
    Route::get('/dashboard/ticket-reports', [AdminDashboardController::class, 'getTicketReports'])
        ->name('admin.dashboard.get-ticket-reports');
    Route::get('/dashboard/get-other-reports', [AdminDashboardController::class, 'getOtherReports'])
        ->name('admin.dashboard.get-other-reports');

    //KYC Management
    Route::put('kyc-management/{kycVerification}/approve', [ApproveKycVerificationController::class, 'index'])
        ->name('kyc-management.approve');
    Route::put('kyc-management/{kycVerification}/expired', [ExpiredKycVerificationController::class, 'index'])
        ->name('kyc-management.expired');
    Route::put('kyc-management/{kycVerification}/decline', [DeclineKycVerificationController::class, 'index'])
        ->name('kyc-management.decline');
    Route::resource('kyc-management', AdminKycController::class)
        ->only(['index', 'show'])
        ->names('kyc-management');

    //User Group Role
    Route::resource('roles', RoleController::class)->except(['show']);
    Route::put('roles/{slug}/change-status', [RoleController::class, 'changeStatus'])
        ->name('roles.status');

    //Application Setting
    Route::get('application-settings/{type?}/{sub_type?}', [ApplicationSettingController::class, 'edit'])
        ->name('application-settings.edit');
    Route::put('application-settings/{type}/update/{sub_type?}', [ApplicationSettingController::class, 'update'])
        ->name('application-settings.update');

    //Node check
    Route::get('node-status', [NodeStatusController::class, 'index'])->name('admin.node-status.index');
    Route::get('node-status/{coin}/{api}', [NodeStatusController::class, 'show'])->name('admin.node-status.show');

    //Admin Notice
    Route::resource('notices', NoticesController::class)
        ->except(['show']);

    Route::get('menu-manager/{menu_slug?}', [NavigationController::class, 'index'])
        ->name('menu-manager.index');
    Route::post('menu-manager/{menu_slug?}/save', [NavigationController::class, 'save'])
        ->name('menu-manager.save');

    //Language
    Route::get('languages/settings', [LanguageController::class, 'settings'])
        ->name('languages.settings');
    Route::get('languages/translations', [LanguageController::class, 'getTranslation'])
        ->name('languages.translations');
    Route::put('languages/settings', [LanguageController::class, 'settingsUpdate'])
        ->name('languages.update.settings');
    Route::put('languages/sync', [LanguageController::class, 'sync'])
        ->name('languages.sync');
    Route::resource('languages', LanguageController::class)
        ->except('show');

    //Ticket Management
    Route::put('tickets/{ticket}/close', [AdminTicketController::class, 'close'])
        ->name('admin.tickets.close');
    Route::put('tickets/{ticket}/resolve', [AdminTicketController::class, 'resolve'])
        ->name('admin.tickets.resolve');
    Route::put('tickets/{ticket}/assign', [AdminTicketController::class, 'assign'])
        ->name('admin.tickets.assign');
    Route::post('tickets/{ticket}/comment', [AdminTicketController::class, 'comment'])
        ->name('admin.tickets.comment.store');
    Route::get('ticket/{ticket}/download-attachment/{fileName}', [AdminTicketController::class, 'download'])
        ->name('admin.tickets.attachment.download');
    Route::resource('tickets', AdminTicketController::class)
        ->only(['index', 'show'])
        ->names('admin.tickets');

    //User Managements
    Route::get('users/{user}/edit/status', [UsersController::class, 'editStatus'])
        ->name('admin.users.edit.status');

    //Update User Status
    Route::put('users/{user}/update/status', [UsersController::class, 'updateStatus'])
        ->name('admin.users.update.status');

    //Search User
    Route::get('users/search', AdminUserSearchController::class)
        ->name('admin.users.search');

    //Users
    Route::resource('users', UsersController::class)
        ->names('admin.users');

    //User activity
    Route::get('users/{user}/activities', [AdminActivityController::class, 'index'])->name('admin.users.activities');

    //User Wallet
    Route::get('users/{user}/wallets', [AdminUserWalletController::class, 'index'])
        ->name('admin.users.wallets.index');

    //User adjust balance
    Route::resource('users/{user}/wallets/{wallet}/adjust-amount', AdjustAmountController::class)
        ->only('create', 'store')
        ->names('admin.users.wallets.adjust-amount');

    //User deposit history
    Route::get('users/{user}/wallets/{wallet}/deposits', [AdminUserDepositController::class, 'index'])
        ->name('admin.users.wallets.deposits.index');

    //User withdrawal history
    Route::get('users/{user}/wallets/{wallet}/withdrawals', [AdminUserWithdrawalController::class, 'index'])
        ->name('admin.users.wallets.withdrawals.index');

    //User bonus history
    Route::get('users/{user}/wallets/{wallet}/bonuses', [AdminUserBonusController::class, 'index'])
        ->name('admin.users.wallets.bonuses.index');

    //User stake history
    Route::get('users/{user}/wallets/{wallet}/stakes', [AdminUserStakeController::class, 'index'])
        ->name('admin.users.wallets.stakes.index');

    //User Open Orders
    Route::get('users/{user}/open-orders', [AdminUserOpenOrderController::class, 'index'])
        ->name('admin.users.open-orders.index');

    //User Trade History
    Route::get('users/{user}/trade-history', AdminUserTradeHistoryController::class)
        ->name('admin.users.trade-history.index');

    //Laravel Log Viewer
    Route::get('logs', [LogViewerController::class, 'index'])
        ->name('logs.index');

    //System wallet
    Route::get('system-wallets', [SystemWalletsController::class, 'index'])
        ->name('admin.system-wallets.index');

    //System wallet deposit
    Route::resource('system-wallets/{wallet}/deposit', SystemDepositController::class)
        ->except('edit')
        ->names('admin.system-wallets.deposit');

    //System wallet withdrawal
    Route::resource('system-wallets/{wallet}/withdrawal', SystemWithdrawalController::class)
        ->except('edit', 'update', 'destroy')
        ->names('admin.system-wallets.withdrawal');

    //Withdrawal Review
    Route::resource('review/withdrawals', AdminWithdrawalReviewController::class)
        ->except('create', 'store', 'edit')
        ->names('admin.review.withdrawals');

    //Withdrawal Review
    Route::resource('history/withdrawals', AdminWithdrawalHistoryController::class)
        ->except('create', 'store', 'edit')
        ->names('admin.history.withdrawals');

    //Deposit Review
    Route::resource('review/bank-deposits', AdminBankDepositReviewController::class)
        ->except('create', 'store', 'edit')
        ->names('admin.review.bank-deposits');

    // deposit amount adjustment
    Route::post('adjust/bank-deposits/{deposit}', AdminBankDepositAdjustController::class)
        ->name('admin.adjust.bank-deposits');

    //Deposit History
    Route::resource('history/deposits', AdminDepositHistoryController::class)
        ->except('create', 'store', 'edit')
        ->names('admin.history.deposits');

    Route::resource('history/ethereum-deposits', AdminEthereumDepositHistoryController::class)
        ->only('index', 'show')
        ->names('admin.history.ethereum-deposits');

    Route::resource('history/binance-deposits', AdminBinanceDepositHistoryController::class)
        ->only('index', 'show')
        ->names('admin.history.binance-deposits');


    //System Bank Account
    Route::put('system-banks/toggle-status/{bankAccount}', [ChangeAdminBankAccountStatusController::class, 'change'])
        ->name('system-banks.toggle-status');
    Route::resource('system-banks', AdminBankManagementController::class)
        ->except('show')
        ->names('system-banks');

    //User Bank Account
    Route::put('user-banks/toggle-status/{bankAccount}', [ChangeAdminBankAccountStatusController::class, 'change'])
        ->name('user-banks.toggle-status');
    Route::resource('user-banks', AdminUserBankManagementController::class)
        ->except('show')
        ->names('user-banks');

    //Post Management
    Route::put('post-categories/{postCategory}/toggle-status', [ChangePostCategoryStatusController::class, 'change'])
        ->name('post-categories.toggle-status');
    Route::resource('post-categories', PostCategoryController::class)
        ->except('show', 'destroy');
    Route::post('posts/{post}/comment', [PostCommentController::class, 'store'])
        ->name('posts.comment');
    Route::post('posts/{post}/comment/{comment}/reply', [ReplyCommentController::class, 'store'])
        ->name('posts.comment.reply');
    Route::put('posts/{post}/toggle-status', [ChangePostStatusController::class, 'change'])
        ->name('posts.toggle-status');
    Route::resource('posts', PostController::class);

    //Comment Management
    Route::resource('comments', PostCommentController::class)
        ->only('index', 'show', 'store', 'edit', 'update', 'destroy')
        ->names('comments');
    Route::put('comments/{comment}/toggle-status', [ChangeCommentStatusController::class, 'change'])
        ->name('comments.toggle-status');

    //Page Management
    Route::get('pages/{page}/visual-edit', [AdminVisualEditController::class, 'edit'])->name('admin.pages.visual-edit');
    Route::put('pages/{page}/visual-update', [AdminVisualEditController::class, 'update'])->name('admin.pages.visual-update');
    Route::get('pages/{page}/visual-edit/{editable_lang}', [AdminVisualEditController::class, 'editOtherLang'])->name('admin.pages.visual-lang-edit');
    Route::put('pages/{page}/visual-update/{editable_lang}', [AdminVisualEditController::class, 'updateOtherLang'])->name('admin.pages.visual-lang-update');
    Route::put('pages/{page}/published', [AdminPageController::class, 'togglePublish'])->name('admin.pages.published');
    Route::put('pages/{page}/home-page', [AdminPageController::class, 'makeHomePage'])->name('admin.pages.home-page');
    Route::get('get-dynamic-content', AdminDynamicContentController::class)->name('admin.dynamic-content');
    Route::resource('pages', AdminPageController::class)->names('admin.pages')->except('show');

    //IDO Token Management
    Route::resource('ido-tokens', AdminStageController::class);
    Route::get('ido-tokens/{stage}/pricing/edit', [AdminStagePricingController::class, 'edit'])
        ->name('ido-tokens.pricing.edit');
    Route::put('ido-tokens/{stage}/pricing/update', [AdminStagePricingController::class, 'update'])
        ->name('ido-tokens.pricing.update');
    Route::get('ido-tokens/{stage}/bonus/edit', [AdminStageBonusController::class, 'edit'])
        ->name('ido-tokens.bonus.edit');
    Route::put('ido-tokens/{stage}/bonus/update', [AdminStageBonusController::class, 'update'])
        ->name('ido-tokens.bonus.update');
    Route::post('ido-tokens/{stage}/icon/update', [AdminStageIconOptionController::class, 'update'])
        ->name('ido-tokens.icon.update');

    // IDO Payment Method
    Route::resource('/payment-methods', PaymentMethodController::class)->except('edit','update', 'destroy');;
    Route::get('/payment-methods/edit/{slug}', [PaymentMethodController::class, 'edit'])->name('payments.setup.edit');
    Route::name('ajax.')->prefix('ajax')->group(function () {
        Route::post('/payment-methods/view', [PaymentMethodController::class, 'show'])->name('payments.view');
        Route::post('/payment-methods/update', [PaymentMethodController::class, 'update'])->name('payments.update');
        Route::post('/payment-methods/quick-update', [PaymentMethodController::class, 'quick_update'])->name('payments.qupdate');
    });
});



