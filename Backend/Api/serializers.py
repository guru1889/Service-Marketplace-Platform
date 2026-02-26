from rest_framework.serializers import ModelSerializer
from django.contrib.auth.models import User
from rest_framework import serializers
from . models import UserProfile
from .models import *
from django.db import transaction


class RegisterSerializer(ModelSerializer):
    phone_number=serializers.CharField(write_only=True,required=True)
    address=serializers.CharField(write_only=True,required=True)
    role=serializers.CharField(write_only=True,default='customer')
    class Meta:
        model=User
        fields=['username','email','password','phone_number','role','address']
        extra_kwargs = {
            'password': {'write_only': True}
        }

    def create(self,validated_data):
        phone=validated_data.pop('phone_number')
        address=validated_data.pop('address')
        role=validated_data.pop('role')
        user=User.objects.create_user(
            username=validated_data['username'],
            password=validated_data['password'],
            email=validated_data['email']
        )
        UserProfile.objects.create(
            user=user,
            phone_number=phone,
            address=address,
            role=role
        )
        return user


    
class Providers_serializer(ModelSerializer):
    provider = serializers.StringRelatedField()
    service = serializers.StringRelatedField()
    class Meta:
        model=Provider
        fields='__all__'

class ProfileSerializer(ModelSerializer):
    class Meta:
        model=UserProfile
        fields='__all__'


class ProviderRegistrationSerializer(serializers.Serializer):
    username = serializers.CharField()
    email = serializers.EmailField(allow_blank=True)
    
    password = serializers.CharField(write_only=True, min_length=6)
    confirmpassword = serializers.CharField(write_only=True)

    phone_number = serializers.CharField()
    address = serializers.CharField(required=False, allow_blank=True)
    image = serializers.ImageField(required=False)
    category = serializers.CharField()
    location = serializers.CharField()
    salary = serializers.CharField(required=False, allow_blank=True)


    def validate_username(self, value):
        if User.objects.filter(username=value).exists():
            raise serializers.ValidationError("Username already exists")
        return value

    def validate_category(self, value):
        value = value.strip()
        if not Services.objects.filter(category__iexact=value).exists():
            raise serializers.ValidationError("Invalid service category")
        return value

    def validate(self, data):
        if data["password"] != data["confirmpassword"]:
            raise serializers.ValidationError({
                "confirmpassword": "Passwords do not match"
            })
        return data

    @transaction.atomic
    def create(self, validated_data):
        validated_data.pop("confirmpassword")

        service = Services.objects.filter(
            category__iexact=validated_data["category"]
        ).first()

        if not service:
            raise serializers.ValidationError({
                "category": "Invalid service category"
            })
        salary = validated_data.get("salary")

        if not salary or salary.strip() == "":
            validated_data["salary"] = "Based on Work"

        user = User.objects.create_user(
            username=validated_data["username"],
            email=validated_data["email"],
            password=validated_data["password"]
        )

        UserProfile.objects.create(
            user=user,
            role="service_provider",
            phone_number=validated_data["phone_number"],
            address=validated_data.get("address", "")
        )

        Provider.objects.create(
            provider=user,
            service=service,
            image=validated_data.get('image'),
            location=validated_data["location"],
            salary=validated_data.get("salary", ""),
            approved=False
        )

        return user


class BookingSerializer(serializers.ModelSerializer):

    provider_name = serializers.CharField(
        source='service_provider.provider.username',
        read_only=True
    )

    service_name = serializers.CharField(
        source='service_provider.service',
        read_only=True
    )
    customer_name=serializers.CharField(
        source='customer.username'
    )
    customer_phone=serializers.CharField(source='customer.userprofile.phone_number')
    customer_address=serializers.CharField(source='customer.userprofile.address')

    class Meta:
        model = Booking
        fields = '__all__'

class UnapprovedProviderSerializer(serializers.ModelSerializer):
    provider_name = serializers.CharField(
        source='provider.username',
        read_only=True
    )
    provider_phone=serializers.CharField(source='provider.userprofile.phone_number')

    service_name = serializers.CharField(
        source='service',
        read_only=True
    )
    class Meta:
        model=Provider
        fields='__all__'

class ProviderUnavailabilitySerializer(serializers.ModelSerializer):
    class Meta:
        model = ProviderUnavailable
        fields = ['date']
