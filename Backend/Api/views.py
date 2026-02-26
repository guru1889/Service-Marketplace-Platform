from django.shortcuts import render
from django.contrib.auth import authenticate
from rest_framework.decorators import api_view
from rest_framework.response import Response
from .serializers import *
from rest_framework_simplejwt.tokens import RefreshToken
from django.shortcuts import get_object_or_404
from datetime import datetime
from rest_framework.permissions import IsAuthenticated,AllowAny
from rest_framework.decorators import permission_classes
from .permissions import IsCustomer
from .permissions import IsServiceProvider,IsAdmin
from rest_framework import status


# Create your views here.


@api_view(['POST'])
def Register(request):

    serializer=RegisterSerializer(data=request.data)
    if serializer.is_valid():
        serializer.save()
        return Response({"message": "register successful"},status=201)
    return Response(serializer.errors, status=400)


@api_view(['POST'])
def Login(request):

    username = request.data.get('username')
    password = request.data.get('password')
   
    if not username or not password:
        return Response(
            {"message": "Username and password required"},
            status=400
        )
    
    user = authenticate(username=username, password=password)

    if not user:
        return Response({"message": "Invalid credentials"}, status=401)

    profile = UserProfile.objects.filter(user=user).first()
    if not profile:
        return Response({"message": "Profile not found"}, status=404)

    profile_data = ProfileSerializer(profile).data
 

    refresh = RefreshToken.for_user(user)

    return Response({
        "message": "login successful",
        "access": str(refresh.access_token),
        "refresh": str(refresh),
        "user": {
            "id": user.id,
            "username": user.username,
            "role":profile.role
        },
        "profile": profile_data
    })

@api_view(['GET'])
@permission_classes([IsAuthenticated,IsCustomer])
def providerapi(request):
    all_data=Provider.objects.all()
    provider=Providers_serializer(all_data,many=True).data
    return Response(provider)

@api_view(["POST"])
def providerRegister(request):
    serializer = ProviderRegistrationSerializer(data=request.data)

    if not serializer.is_valid():
        print("❌ ERRORS:", serializer.errors)   # ← THIS LINE IS MANDATORY
        return Response(serializer.errors, status=400)

    serializer.save()
    return Response({"message": "Registration successful"}, status=201)

@api_view(['GET'])
def getserviceCategory(request):
    category=Services.objects.values("category")
    return Response(category)

@api_view(['GET'])
@permission_classes([IsAuthenticated, IsCustomer])
def getprovider(request, id):
    provider = get_object_or_404(Provider, id=id)
    serializer = Providers_serializer(provider)
    return Response(serializer.data)

@api_view(['GET'])
def getBookedSlots(request, provider_id, date):

    bookings = Booking.objects.filter(
        service_provider_id=provider_id,
        date=date
    )

    booked_times = [
        booking.time.strftime("%H:%M")
        for booking in bookings
    ]

    return Response(booked_times)


@api_view(['GET'])
@permission_classes([IsAuthenticated,IsCustomer])
def appointmentbyuser(request):
    data = Booking.objects.filter(customer=request.user)
    serializer = BookingSerializer(data, many=True)
    return Response(serializer.data)



@api_view(['POST'])
@permission_classes([IsAuthenticated,IsCustomer])
def bookappointment(request):

    provider_id = request.data.get("provider_id")
    date = request.data.get("date")
    time_str = request.data.get("time")

    # 🔹 Validate required fields
    if not provider_id or not date or not time_str:
        return Response(
            {"error": "Provider, date and time are required"},
            status=400
        )

    # 🔹 Check provider exists
    try:
        provider = Provider.objects.get(id=provider_id)
    except Provider.DoesNotExist:
        return Response({"error": "Provider not found"}, status=404)

    # 🔹 Convert time string to time object
    try:
        time_obj = datetime.strptime(time_str, "%H:%M").time()
    except ValueError:
        return Response({"error": "Invalid time format"}, status=400)

    # 🔹 Prevent double booking
    if Booking.objects.filter(
        service_provider=provider,
        date=date,
        time=time_obj
    ).exists():
        return Response(
            {"error": "This slot is already booked"},
            status=400
        )

    # 🔹 Create booking
    Booking.objects.create(
        service_provider=provider,
        customer=request.user,  # logged in user
        date=date,
        time=time_obj
    )

    return Response(
        {"message": "Booking successful"},
        status=201
    )


@api_view(['GET'])
@permission_classes([IsAuthenticated,IsServiceProvider])
def providerdashboard(request):
    bookings = Booking.objects.filter(service_provider__provider=request.user)
    serializer=BookingSerializer(bookings,many=True)
    return Response(serializer.data)

@api_view(['PATCH'])
@permission_classes([IsAuthenticated,IsServiceProvider])
def changeWorkstatus(request,id,status):
    booking=Booking.objects.get(id=id)
    booking.status=status
    booking.save()
    return Response({'message':'status updated successful'})

@api_view(['GET'])
@permission_classes([IsAuthenticated])

def unapprovedproviderforadmin(request):
    unapprovedprovider=Provider.objects.filter(approved=False)
    serializer=UnapprovedProviderSerializer(unapprovedprovider,many=True)
    return Response(serializer.data)

@api_view(['POST'])
@permission_classes([IsAuthenticated, IsAdmin])
def giveapproved(request, id):
    try:
        sanctionprovider = Provider.objects.get(id=id)
        sanctionprovider.approved = True
        sanctionprovider.save()
        return Response({'message': 'approved'})
    except Provider.DoesNotExist:
        return Response({'error': 'Provider not found'}, status=404)


@api_view(['GET'])
@permission_classes([IsAuthenticated, IsAdmin])
def Admindashboardstats(request):
    
    total_users = User.objects.count()
    total_customers = UserProfile.objects.filter(role="customer").count()
    total_providers = UserProfile.objects.filter(role="service_provider").count()
    approved_providers = Provider.objects.filter(approved=True).count()
    total_bookings = Booking.objects.count()
    pending = Booking.objects.filter(status="work pending").count()
    completed = Booking.objects.filter(status="completed").count()
    cancelled = Booking.objects.filter(status="cancelled").count()
    return Response({
        "total_users": total_users,
        "customers": total_customers,
        "providers": total_providers,
        "total_bookings": total_bookings,
        "pending": pending,
        "completed": completed,
        "cancelled": cancelled,
        'approved_provider':approved_providers
    })

@api_view(['POST'])
@permission_classes([IsAuthenticated, IsServiceProvider])
def provider_unavailability(request):

    serializer = ProviderUnavailabilitySerializer(data=request.data)

    if serializer.is_valid():

        # Get Provider object linked to logged-in user
        provider = request.user.provider   # change if your related_name is different

        serializer.save(provider=provider)

        return Response(serializer.data, status=201)

    return Response(serializer.errors, status=400)

@api_view(['GET'])
@permission_classes([IsAuthenticated, IsCustomer])
def get_provider_unavailable_dates(request, provider_id):

    try:
        provider = Provider.objects.get(id=provider_id)
    except Provider.DoesNotExist:
        return Response({"error": "Provider not found"}, status=404)

    unavailable_dates = ProviderUnavailable.objects.filter(
        provider=provider
    ).values_list('date', flat=True)

    # Convert queryset to list of strings
    date_list = [str(date) for date in unavailable_dates]

    return Response(date_list, status=200)