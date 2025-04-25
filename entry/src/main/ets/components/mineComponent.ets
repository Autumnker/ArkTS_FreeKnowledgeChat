import { router } from '@kit.ArkUI'
import { InfoComponent } from "./mine/infoComponent"
import { InfoListComponent } from "./mine/infoListComponent"
import { PersonalComponent } from "./mine/personalComponent"

@Component
export struct MineComponent{
  build(){
    Column(){
      // 个人信息
      Row(){
        PersonalComponent()
      }
      .alignItems(VerticalAlign.Center)
      .height(48)
      .margin({ left:12 , bottom:48})

      // 服务
      Row(){
        InfoComponent({icon:$r('app.media.service'), title:"服务"})
      }
      .alignItems(VerticalAlign.Center)
      .height(48)
      .margin({ top:28 })
      .backgroundColor(Color.White)

      // 服务列表
      Row(){
        InfoListComponent()
      }
      .height(240)
      .margin({ top:20 })
      .backgroundColor(Color.White)

      // 设置
      Row(){
        InfoComponent({icon:$r('app.media.settings'), title:"设置"})
      }
      .alignItems(VerticalAlign.Center)
      .height(48)
      .margin({ top:28 })
      .backgroundColor(Color.White)
      .onClick(()=>{
        router.pushUrl({
          url:'commonViews/exit'
        })
      })

    }
    .height("100%")
    .width("100%")
  }
}