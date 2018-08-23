create table grade(
gradeIdx number(2) primary key,
gradeName varchar2(20) 
);

create table member(
memberIdx number(6) primary key,
name varchar2(40)not null,
id varchar2(40) unique,
pwd varchar2(40)not null,
birthDate date not null,
joinDate date not null,
gender varchar2(10) not null,
email varchar2(50) unique,
tel varchar2(20) not null,
state varchar2(5) default 'N',
memberVerify varchar2(10) default 'N',
memberGradeIdx constraint gradeIdx references grade(gradeIdx)ON DELETE SET NULL
);

create sequence memberSq increment by 1 start with 1;

create table delMember(
delIdx number(6) primary key constraint delIdx references member(memberIdx) ON DELETE CASCADE,
delDate date default sysdate
);

create table mileage(
mileageIdx number(6) primary key,
mileagePrice number(10)not null,
mileageReason varchar2(100) not null,
mileageMemberIdx constraint mileageMemberIdx references member(memberIdx) ON DELETE CASCADE
);

create table store(
storeIdx number(6) primary key,
storeName varchar2(200) not null,
storeImg varchar2(1000) not null,
storeCount number(30) not null,
storeCtg varchar2(50) not null,
storePrice number(10) not null,
storeDate date default sysdate,
storeState varchar2(10) default 'Y'
);

create sequence storeSq increment by 1 start with 1;

create table storepayment(
storePayIdx number(12) primary key,
storePayDate date default sysdate,
storePayCard varchar2(40) not null,
storePayMileage number(7) default 0,
storePayCount number(3) default 1,
storePayState varchar2(20) default '결제완료',
storePayMemberIdx number(6) constraint storePayMemberIdx references member(memberIdx) ON DELETE SET NULL,
storePayStoreIdx number(12) constraint storePayStoreIdx references store(storeIdx) ON DELETE CASCADE
)

create table storedelpayment(
delPaymentStorePayIdx number(12) primary key constraint delPaymentStorePayIdx  references storepayment(storePayIdx) ON DELETE CASCADE,
delPaymentDate DATE default sysdate
)

create table cinema(
cinemaIdx number(6) primary key,
cinemaCity varchar2(20) not null,
cinemaGu varchar2(20) not null,
cinemaBungi varchar2(200) not null,
cinemaAddr varchar2(200) not null,
cinemaName varchar2(100) not null,
cinemaTheater number(3) not null
)

create sequence cinemaSq increment by 1 start with 1;

create table admin(
adminIdx number(6) primary key,
adminId varchar2(30) unique,
adminPwd varchar2(30)not null,
adminJoinDate date default sysdate,
adminGrade number(2) not null,
adminCinemaIdx number(6) constraint adminCinemaIdx references cinema(cinemaIdx) ON DELETE SET NULL
)

create sequence adminSq increment by 1 start with 1;

create table qaboard(
qaIdx number(6)primary key,
qaTitle varchar2(100)not null,
qaContent varchar2(4000) not null,
qaWriteDate date default sysdate,
qaCate varchar2(100) not null,
qaAnswer varchar2(10) default 'N',
qaMemberIdx number(6) constraint qaMemberIdx references member(memberIdx) ON DELETE SET NULL,
qaCinemaIdx number(6) constraint qaCinemaIdx references cinema(cinemaIdx) ON DELETE SET NULL
)

create sequence qaboardSq increment by 1 start with 1;

create table answer(
answerIdx number(6) primary key,
answerAnswer varchar2(2000) not null,
answerAdminIdx number(6) constraint answerAdminIdx references admin(adminIdx) ON DELETE SET NULL,
answerQaIdx number(6) constraint answerQaIdx references qaboard(qaIdx) ON DELETE CASCADE
)

create sequence answerSq increment by 1 start with 1;

create table theater(
theaterIdx number(6) primary key,
theaterCinemaIdx number(6) constraint theaterCinemaIdxPk references cinema(cinemaIdx) ON DELETE CASCADE,
theaterName varchar2(30) not null
)

create sequence theaterSq increment by 1 start with 1;

create table seat (
seatTheaterIdx number(6) constraint seatTheaterIdx references theater(theaterIdx) ON DELETE CASCADE,
seatX number(3) not null,
seatY number(3) not null,
constraint seatPK primary key (seatTheaterIdx,seatX,seatY)
)

create table exit(
exitTheaterIdx number(6) constraint exitTheaterIdx references theater(theaterIdx) ON DELETE CASCADE,
exitX number(3) not null,
exitY number(3) not null,
constraint exitPK primary key (exitTheaterIdx,exitX,exitY)
)

create table movieInfo(
movieIdx number(6) primary key,
movieReleaseDate date default sysdate,
movieName varchar2(20) not null,
movieDirector varchar2(20) not null,
movieActor varchar2(30) not null,
movieSummary varchar2(2000) not null,
movieRunTime number(6) not null,
movieTitleCut varchar2(200) not null,
movieDistributer varchar2(20)not null,
movieGrade number(6) not null,
movieGenre varchar2(50) not null,
movieEndDate date default sysdate
)

create sequence movieInfoSq increment by 1 start with 1;

create table steelCut(
steelCutMovieIdx number(6) constraint steelCutMovieIdx references movieInfo(movieIdx) ON DELETE CASCADE,
steelCutIdx number(6) primary key,
steelCutFileName varchar2(200) not null
)

create sequence steelCutSq increment by 1 start with 1;

create table movieReple(
repleIdx number(6) primary key,
repleScore number(1) not null,
repleContent varchar2(2000) not null,
repleWriteDate date default sysdate,
repleMemberIdx number(6) constraint replekMemberIdx references member(memberIdx)ON DELETE SET NULL,
repleMovieIdx number(6) constraint repleMovieIdx references movieInfo(movieIdx)ON DELETE CASCADE
)

create sequence movieRepleSq increment by 1 start with 1;
    
create table schedule(
scheduleIdx number(6) primary key,
scheduleMovieIdx number(6) not null constraint scheduleMovieIdx references movieInfo(movieIdx)ON DELETE CASCADE,
scheduleTheaterIdx number(6) not null constraint scheduleTheaterIdx references theater(theaterIdx)ON DELETE CASCADE,
scheduleDate Date default sysdate,
scheduleStartTime DATE not null
)

create sequence scheduleSq increment by 1 start with 1;

create table ticketInfo(
ticketIdx number(6) primary key,
ticketAge number(6) not null,
ticketPrice number(10) not null
)

create sequence ticketInfoSq increment by 1 start with 1;

create table reservation(
reservationIdx number(12) primary key,
reservationScheduleIdx number(6) not null constraint reservationScheduleIdx references schedule(scheduleIdx) ON DELETE CASCADE,
reservationTicketIdx number(6) not null constraint reservationTicketIdx references ticketInfo(ticketIdx)ON DELETE SET NULL,
reservationDate Date default sysdate,
reservationMemberIdx number(6) constraint reservationMemberIdx references member(memberIdx) ON DELETE CASCADE
)

create table delreservation(
delReservationIdx number(6) primary key constraint delReservationIdx references reservation(reservationIdx)ON DELETE CASCADE,
delReservaationDate date default sysdate
)

create table event(
eventIdx number(6) primary key,
eventTitleImg varchar2(200) not null,
eventWriteDate date default sysdate,
eventTitle varchar2(200) not null,
eventContent varchar2(2000) not null,
eventState varchar2(10) default 'N',
eventInfoImg varchar2(100) not null
)

create sequence eventSq increment by 1 start with 1;

create table eventReple(
eventRepleIdx number(6) primary key,
eventRepleEvent varchar2(300) not null,
eventRepleWriteDate date default sysdate,
eventRepleMemberIdx number(6) not null constraint eventRepleMemberIdx references member(memberIdx)ON DELETE CASCADE,
eventRepleIdxEventIdx number(6) not null constraint eventRepleIdxEventIdx references event(eventIdx)ON DELETE CASCADE
)

create sequence eventRepleSq increment by 1 start with 1;

create table evWinner(
evWinnerIdx number(6) primary key,
evWinnerEventRepleIdx number(6) not null constraint eventReple references eventReple(eventRepleIdx)ON DELETE CASCADE
)

create sequence evWinnerSq increment by 1 start with 1;
