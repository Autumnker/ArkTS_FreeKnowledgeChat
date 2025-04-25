import { LoginPage } from './startPage/LoginPage'

@Entry
@Component
struct Index {
  build() {
    Column(){
      LoginPage()
    }
    .width("100%")
    .height("100%")
  }
}