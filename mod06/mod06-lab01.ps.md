1. Посчитайте количество процессов, имеющих несколько потоков выполнения.
```
ps -e -o nlwp |tr -d " "| grep -v "^1$"|wc -l
```
2. Запустите top и настройте вывод полей с информацией о процессе следующим образом:
- удалите поля `VIRT`, `RES`, `SHR`;
- добавьте поле `RUSER` и сделайте так, чтобы это поле было показано после поля `USER`;
```
top → f
```
3. В другом терминальном окне выполните команду `passwd` и оставьте ее в состоянии запроса текущего пароля.
4. Перейдите в терминальное окно с top и выполните следующие действия:
- выведите все процессы, для которых реальным пользователем является пользователь, которым Вы вошли в сеанс;
- найдите процесс, запущенный командой `passwd`;
- отправьте этому процессу сигналы 15 (SIGTERM), 2 (SIGINT), 3
(SIGQUIT), 9(SIGKILL).
>Последовательно для каждого сигнала:
```
k;
PID → Enter;
N_сигнала → Enter
```
5. Выполните команду `vim ~/file.txt` и нажмите `Ctrl-Z`.
6. Выполните команду sleep 600, нажмите Ctrl-Z и выполните команду
`jobs`.
7. Последнее задание (`sleep 600`) сделайте фоновым.
```
bg %2
```
8. Измените число `NICE` у задания (`sleep 600`), сделав его равным `10`.
```
renice -n 10 $(pidof sleep)
```
9. Проверьте, что число `NICE` у этого задания изменилось.
```
ps -o pid,nice,pri,comm
```
10. Сделайте задание `vim ~/file.txt` активным и выйдите из редактора.
```
fg %1 и :wq
```
11. Отправьте сигнал 15 (SIGTERM) заданию `sleep 600` и выполните команду `jobs`.
```
sudo kill $(pidof sleep)
```
12. Создайте перехватчик сигналов `SIGINT` и `SIGQUIT` внутри командного интерпретатора, который выводит сообщение «Сигнал заблокирован».
(Используйте встроенную команду `trap`).
```
trap "echo Сигнал заблокирован" 2 3
```
>проверка Ctrl-C и Ctrl-\
