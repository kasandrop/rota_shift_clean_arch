# rotaholic
 
In my ex work place staff worked according to the rolling rota.There were 7 rotas. Basically we worked 5 days in a row and after that we had 2 days off.But there were exception to the mentioned rule because  every 4 weeks we could work 6 times in a row or we could have 3 days off instead of 2.

The environment I work  for required to have the balanced rota so the business could run smoothly. That is why difrent rota have diffrent days off.The environment I work  for required to have the balanced rota so the business could run smoothly.
That is why different rotas have different days off. Staff knew their rotas for the whole year in advance so we could easily plan holidays for example..


screenshots of Rotaholic
<table >
  <tr>
    <td><img src="https://user-images.githubusercontent.com/20933329/116014952-8f225e00-a62f-11eb-9768-ab25be138cf3.jpg"/></td>
    <td><img src="https://user-images.githubusercontent.com/20933329/116014961-96496c00-a62f-11eb-8d03-67623e156675.jpg" /></td>
<td><img src="https://user-images.githubusercontent.com/20933329/116014969-99445c80-a62f-11eb-9a0f-24f71157b924.jpg"/></td>
  </tr>
  <tr>
    <td><img src="https://user-images.githubusercontent.com/20933329/116014990-a3665b00-a62f-11eb-8d49-e57d3887bdbf.jpg"  /></td>
    <td><img src="https://user-images.githubusercontent.com/20933329/116014991-a4978800-a62f-11eb-9331-05239d3ce034.jpg" /></td>
    <td><img src="https://user-images.githubusercontent.com/20933329/116014998-a7927880-a62f-11eb-9bd1-2186782bfc7d.jpg"  /></td>
  </tr>

<tr>
<td><img src="https://user-images.githubusercontent.com/20933329/116014973-9b0e2000-a62f-11eb-9403-6443a4a4a150.jpg"/></td>

<td><img src="https://user-images.githubusercontent.com/20933329/116014978-9d707a00-a62f-11eb-9d36-f4a3a131c6f7.jpg"/></td>

<td><img src="https://user-images.githubusercontent.com/20933329/116014986-a19c9780-a62f-11eb-86b2-f045bbcf4db7.jpg"/></td>
</tr>
</table>






The goal of the app is to show days off for different rotas and different years. Also user of the app can mark on the calendar their taken and future holidays. It is possible to change the standard 8h of taken holidays to 2 h . It used to be quite popular among the staff to shorten their working day.

Development of the app. The technical words.
The main reason of writing it was to gain some experience in the   software development process.
The app is written in dart and Flutter framework is used. The  google cross platform 
development kit. The version of framework was <2.0 so the null safety feature is not used.

I put lots of attention to software architecture. I  tried to structure the code in the way  to follow the domain driven design.
The written software is divided into modules<packages>  in order to achieve the visual separation of these layers. 
High level module:domain doesn't depend on low level<databases>. This is achieved by dependency inversion. 
Use cases communicate with infrastructure layer through interfaces. There is requirement forced by domain level that concrete repositories implement  interface , which is required if these to 2 layers want to communicate.

The role of  the repositories is to cache the data , retrieve the data  . They talk to local or/and remote data sources using of course interfaces. Again it is easy to change the database because details /what kind of data source is used/ depend on abstraction.

Data source's api can be fit into repositories / using adapter design pattern/ 

I use BLOC as    a  state management .User by interaction with ui emits the events. These  flow to Bloc which answers on events by calling the use cases and  streaming states .That causes ui to refresh. Under the  hood the Observer pattern is used   when  blocBuilder widget responds to ui state change. It is very important that this ui level is not polluted with direct calls to databases or  with  other objects which don't belong to the layer.
So we avoid the spaghetti code and maintenance nightmare. 

