// 好友列表中单个好友的数据接口
export interface IaddressBookTopBarItem{
  icon:Resource,
  title:string,
  bgColor:string
}

// 好友列表顶栏
export const AddressBookList:IaddressBookTopBarItem[] = [
  {
    icon:$r('app.media.new_friend'),
    title:'新朋友',
    bgColor:'#FA9E3B'
  },
  {
    icon:$r('app.media.chat_only'),
    title:'仅聊天的朋友',
    bgColor:'#FA9E3B'
  },
  {
    icon:$r('app.media.group_chat'),
    title:'群聊',
    bgColor:'#07C160'
  },
  {
    icon:$r('app.media.tag'),
    title:'标签',
    bgColor:'#1485EF'
  },
  {
    icon:$r('app.media.gong_zhong_hao'),
    title:'公众号',
    bgColor:'#1485EF'
  },
]
