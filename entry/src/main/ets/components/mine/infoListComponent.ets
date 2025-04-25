import { InfoInterface, InfoList } from "../../model/infoData"
import { InfoComponent } from "./infoComponent"

@Component
export struct InfoListComponent{
  isLatest:boolean=false

  build(){
    Column(){
      // 个人信息
      


      // 下方功能表单
      List(){
        ForEach(InfoList,(item:InfoInterface,key)=>{
          ListItem(){
            Row(){
              InfoComponent({
                icon:item.icon,
                title:item.title,
                isLatest:false
              })
                .height(48)
            }
          }
        },(item:InfoInterface)=>item.title)
      }
    }
    .height("100%")
    .width("100%")

  }
}