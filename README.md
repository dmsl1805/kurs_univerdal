# kurs_univerdal
Practicing sprite kit design patterns.
Monster runner the game.
Course project.


View Controllers Hierarchy 

￼
1.Singleton, 2.Factory, 3.Builder, 4.Facade
The initial point of the application is GameViewController that has three buttons with game modes names and images.  Also it has settings button that pushes SettingsViewController where you can choose the difficulty of the game. In this controller I used Factory pattern to solve the problem of creating three game worlds that are the same game world in fact but each has the specific features.
There is a builder pattern inside of the factory. Builder is responsible to build characters with appropriate values. Factory returns the GameScene. Also Factory hides a Facade pattern. One method - createGameWorld do more work - It creates characters for world using builder.
￼
5.Mediator, 6.observer, 7.bridge, 8.iterator, 9.prototype
GameScene that is created by factory is a mediator between screen and game characters. It handles user touches and tell the monsters where to move. Also it observes the main character - Eater and change the health view on the screen. Also GameScene is a bridge because it is an abstract class that has two child : GameSceneTap and GameSceneTime, and own an abstract class- AbstractCharacter. GameScene uses MonsterIterator to iterate monster characters.
AbstractCharacter implements template pattern , so we can create copy of these objects.￼



10.Command and 11.strategy
GameScene uses command pattern to execute character movement and strategy pattern to change moving type (tappable move or linear move);

￼

12.chain of responsibility, 13.Flyweight, 14. proxy
Also there are enemy black holes on the scene with use flyweight to create its own textures, chain of responsibility to decide witch hole is in contact now and proxy to hide physics body of the hole sprite node.
￼
15.Memento
User can pause the game scene and I used the memento pattern to save the state of  monsters positions, rotation and velocity;
