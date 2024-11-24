from rest_framework import viewsets
from .models import User, Post, Comment, Like, SavedContent
from .serializers import UserSerializer, PostSerializer, CommentSerializer, LikeSerializer, SavedContentSerializer


class UserViewSet(viewsets.ModelViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer


class PostViewSet(viewsets.ModelViewSet):
    queryset = Post.objects.all()
    serializer_class = PostSerializer


class CommentViewSet(viewsets.ModelViewSet):
    queryset = Comment.objects.all()
    serializer_class = CommentSerializer


class LikeViewSet(viewsets.ModelViewSet):
    queryset = Like.objects.all()
    serializer_class = LikeSerializer


class SavedContentViewSet(viewsets.ModelViewSet):
    queryset = SavedContent.objects.all()
    serializer_class = SavedContentSerializer
