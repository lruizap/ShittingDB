from django.db import models


class User(models.Model):
    name = models.CharField(max_length=100)  # User's name
    email = models.EmailField(unique=True)  # Unique email
    password = models.TextField()  # Encrypted password
    registration_date = models.DateTimeField(auto_now_add=True)
    # Automatically set on creation
    bio = models.TextField(blank=True, null=True)  # Optional bio
    profile_image = models.URLField(blank=True, null=True)
    # Optional profile image URL

    def __str__(self):
        return self.name


class Post(models.Model):
    CONTENT_TYPES = [
        ('joke', 'Joke'),
        ('photo', 'Photo'),
        ('video', 'Video'),
    ]

    user = models.ForeignKey(
        User, on_delete=models.CASCADE, related_name='posts')
    # Link to the user who created the post
    content_type = models.CharField(max_length=50, choices=CONTENT_TYPES)
    # Content type
    content = models.TextField()  # Text for jokes or URL for media
    upload_date = models.DateTimeField(auto_now_add=True)
    # Automatically set on creation
    likes_count = models.PositiveIntegerField(
        default=0)  # Optional likes count
    comments_count = models.PositiveIntegerField(
        default=0)  # Optional comments count

    def __str__(self):
        return f"{self.user.name} - {self.content_type}"


class Comment(models.Model):
    user = models.ForeignKey(
        User, on_delete=models.CASCADE, related_name='comments')
    # Link to the user who commented
    post = models.ForeignKey(
        Post, on_delete=models.CASCADE, related_name='comments')
    # Link to the commented post
    content = models.TextField()  # Comment text
    comment_date = models.DateTimeField(auto_now_add=True)
    # Automatically set on creation

    def __str__(self):
        return f"Comment by {self.user.name} on {self.post.id}"


class Like(models.Model):
    user = models.ForeignKey(
        User, on_delete=models.CASCADE, related_name='likes')
    # Link to the user who liked
    post = models.ForeignKey(
        Post, on_delete=models.CASCADE, related_name='likes')
    # Link to the liked post
    like_date = models.DateTimeField(auto_now_add=True)
    # Automatically set on creation

    class Meta:
        unique_together = ('user', 'post')  # Prevent duplicate likes

    def __str__(self):
        return f"{self.user.name} liked {self.post.id}"


class SavedContent(models.Model):
    user = models.ForeignKey(
        User, on_delete=models.CASCADE, related_name='saved_contents')
    # Link to the user who saved the content
    post = models.ForeignKey(
        Post, on_delete=models.CASCADE, related_name='saved_by')
    # Link to the saved post
    save_date = models.DateTimeField(auto_now_add=True)
    # Automatically set on creation

    class Meta:
        unique_together = ('user', 'post')  # Prevent duplicate saved content

    def __str__(self):
        return f"{self.user.name} saved {self.post.id}"
