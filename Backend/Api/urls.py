from django.contrib import admin
from django.urls import path
from . import views
from django.conf import settings
from django.conf.urls.static import static
from rest_framework_simplejwt.views import (
    TokenObtainPairView,
    TokenRefreshView,
)

urlpatterns = [
    path('register/',views.Register),
    path('login/',views.Login),
    path('service_providers',views.providerapi),
    path('providerRegister',views.providerRegister),
    path('categories',views.getserviceCategory),
    path('getprovider/<int:id>',views.getprovider),
    path("bookappointment/", views.bookappointment),
    path("getBookedSlots/<int:provider_id>/<str:date>/", views.getBookedSlots),
    path('api/token/', TokenObtainPairView.as_view()),
    path('api/token/refresh/', TokenRefreshView.as_view()),
    path('bookingdatabycustomer/', views.appointmentbyuser),
    path('providerdashboard',views.providerdashboard),
    path('changeworkstatus/<int:id>/<str:status>',views.changeWorkstatus),
    path('unapprovedprovider',views.unapprovedproviderforadmin),
    path('sanctionapproved/<int:id>/',views.giveapproved),
    path('admindashboardstats',views.Admindashboardstats),
    path('providerunavilability',views.provider_unavailability),
    path("get-provider-unavailable-dates/<int:provider_id>/",views.get_provider_unavailable_dates),
]+ static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)