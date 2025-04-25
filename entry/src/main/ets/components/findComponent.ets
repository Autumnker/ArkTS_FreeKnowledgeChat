import { FindDataList, IFindItem } from "../model/findData"
import { FindItem1 } from "./find/findItem1"
import { FindItem2 } from "./find/findItem2"
import { FindItem3 } from "./find/findItem3"
import { router } from "@kit.ArkUI"

@Component
export struct FindComponent{
  build() {
    Column(){
      Row(){
        Text("发现")
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
      }
      .justifyContent(FlexAlign.Center)
      .width("100%")
      .height(60)
      .backgroundColor("#EDEDED")
      List(){
        ForEach(FindDataList,(item:IFindItem,key)=>{
          //  朋友圈       扫一扫       摇一摇       搜一搜       附近        购物          小程序
          if(key == 0 || key == 3 || key == 4 || key == 6 || key == 7 || key == 8 || key == 10){
            if(key==0){ // 当前只显示朋友圈就足够了
              ListItem(){
                FindItem1({
                  icon:item.icon,
                  title:item.title,
                  headIcon:item.headIcon,
                  desc:item.desc,
                  isRedPoint:item.isRedPoint
                })
                  .backgroundColor(Color.White)
                  .height(48)
                  .margin({ bottom:16 })
              }
              .onClick(()=>{
                if(key==0){
                  /*进入朋友圈页面*/
                  router.pushUrl({
                    url:"components/find/Monents/moments"
                  })
                }
              })

            }
          }
          // 视频号
          if(key == 1){
            ListItem(){
              FindItem2({
                icon:item.icon,
                title:item.title,
                headIcon:item.headIcon,
                desc:item.desc,
                isRedPoint:item.isRedPoint
              })
                .backgroundColor(Color.White)
                .height(48)
            }
          }
          // 直播         看一看       游戏
          if(key == 2 || key == 5 || key == 9){
            ListItem(){
              FindItem3({
                icon:item.icon,
                title:item.title,
                headIcon:item.headIcon,
                desc:item.desc,
                isRedPoint:item.isRedPoint
              })
                .margin({ top:20 })
                .backgroundColor(Color.White)
                .height(48)
            }
          }

        },(item:IFindItem)=>item.title)
      }


    }
    .width("100%")
    .height("100%")

  }
}