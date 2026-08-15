from rest_framework import serializers

from .models import Family, FamilyMember, User

class FamilyMemberSerializer(serializers.ModelSerializer):
    class Meta:
        model = FamilyMember
        fields = [
            "id",
            "name",
            "age",
            "gender",
            "height_cm",
            "weight_kg",
            "activity_level",
            "goal",
        ]

class FamilySerializer(serializers.ModelSerializer):
    members = FamilyMemberSerializer(many=True, read_only=True)

    class Meta:
        model = Family
        fields = [
            "id",
            "name",
            "city",
            "monthly_budget",
            "created_at",
            "members",
        ]


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = [
            "id",
            "email",
            "full_name",
            "phone",
            "role",
            "family",
            "created_at",
        ]


class FamilyCreateSerializer(serializers.ModelSerializer):
    members = FamilyMemberSerializer(many=True, write_only=True)
    
    class Meta:
        model = Family
        fields = [
            "id",
            "name",
            "city",
            "monthly_budget",
            "members",
        ]
        read_only_fields = ["id"]
    
    def create(self, validated_data):
        members_data = validated_data.pop("members")
        family = Family.objects.create(**validated_data)
        
        for member_data in members_data:
            FamilyMember.objects.create(family=family, **member_data)
        
        return family