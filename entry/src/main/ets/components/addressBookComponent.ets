import { router } from '@kit.ArkUI'
import { exampleMsg0 } from '../model/message'
import { PersonInterface } from "../model/person"
import { AddressBookListComponent } from "./addressBook/addressBookListCompont"
import { Head } from "./utils/head"
import { JumpToChatPage } from './utils/jumpToChatPage'
import { SearchComponent } from "./utils/searchComponent"

const characters = ['A','B','C','D','E','F','G','H','I','J','K','L','M',
                    'N','O','P','Q','R','S','T','U','V','W','X','Y','Z','#']

// 名字首字母接口
interface ContractPersonInterface{
  char:string,
  personItem:PersonInterface[]
}

// 通讯录组件
@Component
export struct AddressBookComponent{
  // 模拟好友列表数据
  @State personList: ContractPersonInterface[] = [
    {
      char:'A',
      personItem:[
        {
          icon: $r('app.media.chatAvatar1'),
          name: "Alex"
        },
        {
          icon: $r('app.media.chatAvatar4'),
          name: "Alice"
        }
      ]
    },
    {
      char:'B',
      personItem:[
        {
          icon: $r('app.media.chatAvatar2'),
          name: "Brain"
        },
        {
          icon:$r('app.media.chatAvatar7'),
          name:"Brown"
        }
      ]
    },
    {
      char:'C',
      personItem:[{
        icon:$r('app.media.chatAvatar3'),
        name:"Clion"
      }]
    },
    {
      char:'E',
      personItem:[{
        icon:$r('app.media.chatAvatar5'),
        name:"Eclips"
      }]
    },
    {
      char:'F',
      personItem:[{
        icon:$r('app.media.chatAvatar6'),
        name:"Frank"
      }]
    },
    {
      char:'#',
      personItem:[
        {
          icon: $r('app.media.chatAvatar8'),
          name: "@AKA"
        },
        {
          icon: $r('app.media.theboys8'),
          name: "~~~(^v^)~~~"
        }
      ]
    }
  ]
  @State selectedIndex:number=0
  scroller:Scroller = new Scroller()

  @Builder
  GroupHeader(word:string){
    Row(){
      Text(word)
        .fontSize(18)
        .width("100%")
        .padding(5)
        .margin({left:10})
    }
  }

  build(){
    Column(){
      Row() {
        // 顶栏
        Head({
          text: '好友',
          icon: $r('app.media.add_friend')
        })
          .width("100%")
          .height(34)
          .margin({ top: 8 })
      }
      .justifyContent(FlexAlign.Center)
      .align(Alignment.Center)
      .onClick(()=>{
        router.pushUrl({
          url:'commonViews/searchFriend'
        })
      })

      // 头部选项
      Stack({alignContent:Alignment.End}) {
        List() {
          ListItem() {
            Column() {

              // 搜索框
              SearchComponent()

              //  不同功能的标签栏
              AddressBookListComponent()
                .padding({ top: 12 })

              // 好友列表
              List({ scroller: this.scroller }) {
                ForEach(this.personList, (wordItem: ContractPersonInterface, key) => {
                  ListItemGroup({
                    header: this.GroupHeader(wordItem.char)
                  }) {
                    ForEach(wordItem.personItem, (p: PersonInterface, key2) => {
                      ListItem() {
                        Row() {
                          Image(p.icon)
                            .borderRadius(6)
                            .width(24)
                            .height(24)
                          Text(p.name)
                            .fontSize(18)
                            .width('100%')
                            .padding(12)
                        }
                        .margin({ left:10 , top:5})
                        .justifyContent(FlexAlign.Center)
                        .height(48)
                        .onClick(()=>{
                          JumpToChatPage(p,exampleMsg0)
                        })
                      }
                    }, (p: PersonInterface) => (p.name))
                  }
                }, (wordItem: ContractPersonInterface) => wordItem.char)
              }
              .sticky(StickyStyle.Header)
              .onScrollIndex((index: number) => {
                this.scroller.scrollToIndex(index)
              })
            }
          }
        }
        // 字母索引
        AlphabetIndexer({
          arrayValue: characters,
          selected: 0
        })
          .margin({ top:150 })
          .selected(this.selectedIndex)
          .onSelect((index) => {
            this.selectedIndex = index
            this.scroller.scrollToIndex(index)
          })
      }

    }
    .height("100%")
    .width("100%")
  }
}