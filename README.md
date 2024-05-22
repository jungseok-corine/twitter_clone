# 트위터 클론코딩

---
1. 데이터 새로고침을 할때 사용(테이블뷰나 콜렉션뷰 데이터를 새로고침할때 유용)

let refreshControl = UIRefreshControl()
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)

// 시작

refreshControl.beginFreshing()

// 종료

refreshControl.endFreshing()


---
## 검색기능
