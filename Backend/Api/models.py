from django.db import models
from django.contrib.auth.models import User
# Create your models here.

class UserProfile(models.Model):
    role_choice=(
        ('customer','Customer'),
        ('service_provider','Service_provider'),
        ('admin','Admin')
    )
    user=models.OneToOneField(User,on_delete=models.CASCADE,related_name='userprofile')
    role=models.CharField(max_length=30,choices=role_choice,default='customer')
    phone_number=models.CharField(max_length=10)
    address=models.CharField(max_length=250,null=True)
    def __str__(self):
        return self.user.username


class Services(models.Model):
    category=models.CharField(max_length=30)
    description=models.TextField()
    def __str__(self):
        return(self.category)


class Provider(models.Model):
    image = models.ImageField(upload_to='providers/',default='localservice.jpg')
    provider=models.OneToOneField(User,on_delete=models.CASCADE)
    service=models.ForeignKey(Services,on_delete=models.CASCADE)
    approved=models.BooleanField(default=False)
    location=models.CharField(max_length=30,null=True)
    salary = models.CharField(
    max_length=100,
    default='Based on Work',
    blank=True
    )

    def __str__(self):
        return self.provider.username




class Booking(models.Model):
    STATUS_CHOICES = (
        ('work pending', 'work Pending'),
        
        ('completed', 'Completed'),
        ('cancelled', 'Cancelled'),
    )

    service_provider=models.ForeignKey(Provider,related_name='provider_booking',on_delete=models.CASCADE)
    customer=models.ForeignKey(User,on_delete=models.CASCADE,related_name='customer_booking')
    date=models.DateField()
    time=models.TimeField()
    status = models.CharField(max_length=20, choices=STATUS_CHOICES, default='work pending')
    created_on=models.DateTimeField(auto_now_add=True)
    def __str__(self):
        return f"{self.customer.username} - {self.service.name}"



class Review(models.Model):
    booking = models.OneToOneField(Booking, on_delete=models.CASCADE)
    rating = models.IntegerField()
    comment = models.TextField(blank=True)

    def __str__(self):
        return f"Review for booking {self.booking.id}"
    

class ProviderAvailability(models.Model):
    provider = models.ForeignKey(Provider, on_delete=models.CASCADE)
    day = models.CharField(
        max_length=10,
        choices=(
            ('mon', 'Monday'),
            ('tue', 'Tuesday'),
            ('wed', 'Wednesday'),
            ('thu', 'Thursday'),
            ('fri', 'Friday'),
            ('sat', 'Saturday'),
            ('sun', 'Sunday'),
        )
    )
    start_time = models.TimeField()  # 10:00
    end_time = models.TimeField()    # 20:00

class ProviderDayStatus(models.Model):
    provider = models.ForeignKey(Provider, on_delete=models.CASCADE)
    date = models.DateField()
    is_full_day_busy = models.BooleanField(default=False)

class ProviderUnavailable(models.Model):
    provider = models.ForeignKey(Provider, on_delete=models.CASCADE)
    date = models.DateField()

    def __str__(self):
        return f"{self.provider} - {self.date}"





