from rest_framework.permissions import BasePermission

class IsCustomer(BasePermission):
    def has_permission(self, request, view):
        return request.user.userprofile.role == "customer"

class IsServiceProvider(BasePermission):
    def has_permission(self, request, view):
        return request.user.userprofile.role == "service_provider"


class IsAdmin(BasePermission):
    def has_permission(self, request, view):

        if not request.user or not request.user.is_authenticated:
            return False

        try:
            role = request.user.userprofile.role
            return role and role.lower() == "admin"
        except:
            return False