## 볼링 점수판 미션 저장소
### Effective Swift with TDD, Clean Code
NEXTSTEP with yagom-academy

### 프로그램 요구사항 분석
1. 플레이어의 이름(PlayerName)을 입력받는다. - InputView
2. 점수판(ScoreBoard)을 출력한다.
    - Bowling이 현재 ScoreBoard를 출력해달라고 요청한다. -> Delegate에게 요청
    - ScoreBoard에게 점수들(Scores(점수 보관하는 객체))을 출력물로 변환해달라 요청한다.
    - OutputView가 출력물(String 타입)을 출력한다.
3. 10개의 프레임에 대한 투구를 입력받는다.
    - 현재 프레임 투구를 입력받는다. - InputView
    - 입력받은 투구를 쓰러뜨린 핀의 개수 객체()로 변환한다. - BowlingParser
    - Bowling이 Pin을 받아서 현재 Frame에 기록한다.
    - 만일 다음 Frame으로 넘어가야 한다면, Frame이 새로운 Frame인스턴스를 생성하여 교체한다.
    - 다음 Frame으로 넘어가지 않고, 카운트로 기록해야 한다면 -> Frame이 한다.
    - 10개이면?
        - (현재 남은 핀의 개수보다 커야 한다.)
        - 스트라이크로 기록한다.
        - 현재 프레임을 체크한다.
            - 10프레임이면 -> 3번째 스코어
            - 아니면 -> 다음 프레임으로 넘어간다.
    - 10개 미만이면 
        - 현재가 몇번째 스코어인지 체크한다. 
        - 1번째 스코어이면 -> 2번째 스코어로 이동
        - 2번재 스코어이면 -> 
            스페어/미스/거터 인지 상태 판별
            - 만일 스페어라면 -> 현재가 10번째 프레임인지 묻는다. 맞다면 다음 스코어 / 아니면 다음 프레임
            - 스페어가 아니면 -> 다음 프레임으로 이동한다. 

4. ScoreBoard를 출력해라
- Bowling이 Frame에 대한 정보를 전부 가지고 있다.
- ScoreBoard = 출력할 String타입으로 바꾸는 것
- OuputView를 통해 ScoreBoard를 출력한다.

 
     
 

