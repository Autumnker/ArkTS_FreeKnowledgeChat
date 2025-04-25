import { AddressBookComponent } from '../../components/addressBookComponent'
import { ChatComponent } from '../../components/chatComponent'
import { MineComponent } from '../../components/mineComponent'
import { FindComponent } from '../../components/findComponent'

@Entry
@Component
struct Main {
  @State isLogin:boolean = false  // 默认没有登录
  @State currentIndex:number = 0  //登录后默认页面的编号

  // 控制器
  tabsController:TabsController = new TabsController()
  // 底边栏
  @Builder Bottombar(title:string, targetIndex:number, normalImg:Resource,selectImg:Resource){
    Column(){
      Image(this.currentIndex == targetIndex? selectImg:normalImg)
        .width(28)
        .height(28)
      Text(title)
        .padding({
          top:3
        })
        .fontColor(this.currentIndex == targetIndex? '#07c160' :Color.Gray)
    }
    .onClick(()=>{
      this.currentIndex=targetIndex
    })
  }

  build() {
    Column(){
        Tabs({
          barPosition: BarPosition.End,
          controller: this.tabsController,
          index: this.currentIndex
        }) {
          // 聊天Tab
          TabContent() {
            ChatComponent()
          }
          .tabBar(this.Bottombar('聊天', 0, $r('app.media.chatPage_origin'), $r('app.media.chatPage_selected')))
          .width("100%")
          .height("100%")

          // 通讯录Tab
          TabContent() {
            AddressBookComponent()
          }
          .tabBar(this.Bottombar('通讯录', 1, $r('app.media.addressBook_origin'), $r('app.media.addressBook_selected')))
          .width("100%")
          .height("100%")

          // 发现Tab
          TabContent() {
            FindComponent()
          }
          .tabBar(this.Bottombar('发现', 2, $r('app.media.find_origin'), $r('app.media.find_selected')))
          .width("100%")
          .height("100%")

          // 我的Tab
          TabContent() {
            MineComponent()
          }
          .tabBar(this.Bottombar('我的', 3, $r('app.media.mine_origin'), $r('app.media.mine_selected')))
          .width("100%")
          .height("100%")
        }
    }
    .width("100%")
    .height("100%")
  }

}