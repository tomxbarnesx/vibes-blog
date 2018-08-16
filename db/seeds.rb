User.create(first_name: 'Tom', last_name: 'Barnes', password: '1234', email: 'hotchiligumption@gmail.com', birthday: '19900313', blog_name: 'Concrete Carnival', photo_url: '/images/tomb-profile.jpg');
User.create(first_name: 'Miles', last_name: 'Davis', password: '1234', email: 'mdtrumpet@hotmail.com', birthday: '19260526', blog_name: 'The Birth of the Cool', photo_url: '/images/milesdavis.jpg');

Vibe.create(name: 'Latest', user_id: 1);
Vibe.create(name: 'Fuego', user_id: 1);
Vibe.create(name: 'Latest', user_id: 2);
Vibe.create(name: 'Jazz Cabbage', user_id: 2);
Vibe.create(name: 'New Live Evil', user_id: 2);

Post.create(title: 'Trap Disneyland?', song_uri: '<iframe src="https://open.spotify.com/embed/track/7wBJfHzpfI3032CSD7CE2m" width="300" height="380" frameborder="0" allowtransparency="true" allow="encrypted-media"></iframe>', post_body: 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for will uncover many web sites still in their infancy.');
Post.create(title: 'Kamasi\'s Dream', song_uri: '<iframe src="https://open.spotify.com/embed/track/2kTWcP2fid9TKLdcRuiAq4" width="300" height="380" frameborder="0" allowtransparency="true" allow="encrypted-media"></iframe>', post_body: 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for will uncover many web sites still in their infancy.');
Post.create(title: 'Space Cadillacs', song_uri: '<iframe src="https://open.spotify.com/embed/track/4UIfBRnJoiGeQhBec0mHm0" width="300" height="380" frameborder="0" allowtransparency="true" allow="encrypted-media"></iframe>', post_body: 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for will uncover many web sites still in their infancy.');
Post.create(title: 'Imani\'s Vibe', song_uri: '<iframe src="https://open.spotify.com/embed/track/5IIq5uEYpUZoSjTEjqn7q1" width="300" height="380" frameborder="0" allowtransparency="true" allow="encrypted-media"></iframe>', post_body: 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for will uncover many web sites still in their infancy.');
Post.create(title: 'What I Say?', song_uri: '<iframe src="https://open.spotify.com/embed/track/4XTtGRL6dJgXm3TWWwEFDU" width="300" height="380" frameborder="0" allowtransparency="true" allow="encrypted-media"></iframe>', post_body: 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for will uncover many web sites still in their infancy.');
Post.create(title: 'Inamorata 2', song_uri: '<iframe src="https://open.spotify.com/embed/track/6Nmmmpujq5cbqhKOcu7qyb" width="300" height="380" frameborder="0" allowtransparency="true" allow="encrypted-media"></iframe>', post_body: 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for will uncover many web sites still in their infancy.');


Tag.create(name: 'Hip-hop');
Tag.create(name: 'Rock');
Tag.create(name: 'Jazz');
Tag.create(name: 'Psychedelic');

VibeConnection.create(vibe_id: 1, post_id: 1);
VibeConnection.create(vibe_id: 1, post_id: 2);
VibeConnection.create(vibe_id: 2, post_id: 1);
VibeConnection.create(vibe_id: 2, post_id: 2);
VibeConnection.create(vibe_id: 3, post_id: 3);
VibeConnection.create(vibe_id: 3, post_id: 4);
VibeConnection.create(vibe_id: 4, post_id: 3);
VibeConnection.create(vibe_id: 4, post_id: 4);
VibeConnection.create(vibe_id: 5, post_id: 5);
VibeConnection.create(vibe_id: 5, post_id: 6);
VibeConnection.create(vibe_id: 3, post_id: 5);
VibeConnection.create(vibe_id: 3, post_id: 6);


TagConnection.create(vibe_id: 1, tag_id: 1);
TagConnection.create(vibe_id: 1, tag_id: 4);
TagConnection.create(vibe_id: 2, tag_id: 1);
TagConnection.create(vibe_id: 2, tag_id: 4);
TagConnection.create(vibe_id: 3, tag_id: 3);
TagConnection.create(vibe_id: 3, tag_id: 4);
TagConnection.create(vibe_id: 4, tag_id: 3);
TagConnection.create(vibe_id: 4, tag_id: 4);
TagConnection.create(vibe_id: 5, tag_id: 3);
TagConnection.create(vibe_id: 5, tag_id: 4);