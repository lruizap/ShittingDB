-- Create the User table
CREATE TABLE "User" (
    id SERIAL PRIMARY KEY, -- Unique identifier, auto-increment
    name VARCHAR(100) NOT NULL, -- User's name
    email VARCHAR(255) UNIQUE NOT NULL, -- Unique email
    password TEXT NOT NULL, -- Encrypted password
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Registration date with default value
    bio TEXT, -- Short user description (optional)
    profile_image TEXT -- Profile image URL (optional)
);

-- Create the Post table
CREATE TABLE "Post" (
    id SERIAL PRIMARY KEY, -- Unique identifier, auto-increment
    user_id INT NOT NULL, -- Relationship with the User table (who created the post)
    content_type VARCHAR(50) NOT NULL, -- Content type (joke, photo, video)
    content TEXT NOT NULL, -- Text (for jokes) or URL (for photos and videos)
    upload_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Post upload date
    likes_count INT DEFAULT 0, -- Likes counter (optional, starts at 0)
    comments_count INT DEFAULT 0, -- Comments counter (optional, starts at 0)
    CONSTRAINT fk_post_user FOREIGN KEY (user_id) REFERENCES "User" (id) ON DELETE CASCADE
);

-- Create the Comment table
CREATE TABLE "Comment" (
    id SERIAL PRIMARY KEY, -- Unique identifier, auto-increment
    user_id INT NOT NULL, -- Relationship with the User table (who made the comment)
    post_id INT NOT NULL, -- Relationship with the Post table (commented post)
    content TEXT NOT NULL, -- Comment text
    comment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Comment date
    CONSTRAINT fk_comment_user FOREIGN KEY (user_id) REFERENCES "User" (id) ON DELETE CASCADE,
    CONSTRAINT fk_comment_post FOREIGN KEY (post_id) REFERENCES "Post" (id) ON DELETE CASCADE
);

-- Create the Like table
CREATE TABLE "Like" (
    id SERIAL PRIMARY KEY, -- Unique identifier, auto-increment
    user_id INT NOT NULL, -- Relationship with the User table (who gave the like)
    post_id INT NOT NULL, -- Relationship with the Post table (liked post)
    like_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Date the like was given
    CONSTRAINT fk_like_user FOREIGN KEY (user_id) REFERENCES "User" (id) ON DELETE CASCADE,
    CONSTRAINT fk_like_post FOREIGN KEY (post_id) REFERENCES "Post" (id) ON DELETE CASCADE,
    CONSTRAINT unique_like UNIQUE (user_id, post_id) -- Prevent duplicate likes
);

-- Create the SavedContent table
CREATE TABLE "SavedContent" (
    id SERIAL PRIMARY KEY, -- Unique identifier, auto-increment
    user_id INT NOT NULL, -- Relationship with the User table (who saved the content)
    post_id INT NOT NULL, -- Relationship with the Post table (saved content)
    save_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Date the content was saved
    CONSTRAINT fk_savedcontent_user FOREIGN KEY (user_id) REFERENCES "User" (id) ON DELETE CASCADE,
    CONSTRAINT fk_savedcontent_post FOREIGN KEY (post_id) REFERENCES "Post" (id) ON DELETE CASCADE,
    CONSTRAINT unique_savedcontent UNIQUE (user_id, post_id) -- Prevent duplicate saved content
);
