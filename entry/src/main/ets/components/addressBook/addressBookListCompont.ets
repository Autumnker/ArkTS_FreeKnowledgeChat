import { AddressBookList, IaddressBookTopBarItem } from "../../model/addressBookTopBar"
import { AddressBookItem } from "./addressBookItem"

@Component
export struct AddressBookListComponent{
  build() {
    Column(){
      List(){
        ForEach(AddressBookList,(item:IaddressBookTopBarItem, key)=>{
          ListItem(){
            Column(){
              AddressBookItem({
                icon:item.icon,
                title:item.title,
                bgColor:item.bgColor
              })
              Divider().strokeWidth(0.5).color('#E7E7E7') // 分割线
            }
            .height(32)
          }
        },(item:IaddressBookTopBarItem)=>JSON.stringify(item))
      }

    }
    .width("100%")
    .height('auto')

  }
}