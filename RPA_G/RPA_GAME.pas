Program Rpg;
Uses Crt;
// Переменные
Var PlayerHeal,PlayerDamage, PlayerExp, WeaponDamage, WeaponUp, diferent, BotleDamage, BotleWeapon:integer;
PlayerComand, Names:string;
number, num: integer;
Weapons: array[1..2] of integer;
BotleHeal: array[1..3] of integer;
TextCL: array[1..8, 1..14] of integer;
//глобальные перемены для моба(улучшения системы боя)
 var damageMob,healMob:integer;
 var nameMob:string;
 var decisionEscape:integer;
 
 //процедура бега
 procedure escape();
 var ranDamage:integer; // случайный урон по игроку в попытке убежать
 begin
 Randomize;
  Writeln('Вы рeшили убежать');
  decisionEscape:=Random(2);
  if nameMob = 'Обычный заец' then
    begin
      Writeln('Бежать от насколько слабого существа, та вы трус');
      Writeln('Вас убил бог смелости');
      PlayerHeal:=0;
    end;
  if decisionEscape = 1 then
    begin
      Writeln('Вы успешно убежали');
    end
  else
   begin
      Writeln('Вам не удалося убежать');
      Writeln('Вы теряете случайное количество здоровья, но остаётесь живы и смогли убежать');
      ranDamage:=Random(80)+10;
      PlayerHeal:=PlayerHeal - ranDamage;
      Writeln('У вас остальсь ', PlayerHeal, ' здоровья');
   end;
 end;

 // процедура для личения
procedure UpHeal();
begin
  TextColor(TextCL[6,1]);
  Writeln('Выберете баночку: ');
  Writeln('   1 - Маленькая +10');
  Writeln('   2 - Средняя   +30');
  Writeln('   3 - Большая   +75');
  Readln(number);
  Case number of
  1: If BotleHeal[1] > 0 then 
        begin
        PlayerHeal:= PlayerHeal + 10;
        BotleHeal[1]:= BotleHeal[1] - 1;
        Writeln('У вас осталося ',BotleHeal[1]);
        Writeln('У  ваш характеристика ',PlayerHeal);
        end;
  2: If BotleHeal[2] > 0 then 
        begin
        PlayerHeal:= PlayerHeal + 30;
        BotleHeal[2]:= BotleHeal[2] - 1;
        Writeln('У вас осталося ',BotleHeal[2]);
        Writeln('У  ваш характеристика ',PlayerHeal);
        end;
  3: If BotleHeal[3] > 0 then 
        begin
        PlayerHeal:= PlayerHeal + 75;
        BotleHeal[3]:= BotleHeal[3] - 1;
        Writeln('У вас осталося ',BotleHeal[3]);
        Writeln('У  ваш характеристика ',PlayerHeal);
        end;
  else Writeln('Ошибка');
  end;
end;
// процедуры
// процедура для вызова надписей команд 
// обучения 
//Все мобы
procedure FightC();
// этот код не трогать главная часть системы боя
// улучшения системы боя, добавлен случайны урон по противнику 
var trueDamage:integer;
label z;
  begin
Randomize;
z:
 if WeaponDamage = 30 then
    begin
      trueDamage:=Random(30)+5;
    end
 else if WeaponDamage = 35 then 
    begin
      trueDamage:=Random(30)+10;
    end
  else
    begin
      trueDamage:=Random(35)+30;
    end;
    repeat
         healMob:= healMob - trueDamage ;
         Writeln('Вы атакуете,');
         if (healMob = 0) or (healMob < 0) then
           begin
              healMob:= 0
           end;
         Writeln('У противника осталось ', healMob);
         if (healMob = 0) or (healMob < 0) then
           begin
              break;
           end;
          Writeln(nameMob,' атакует в ответ ');
          PlayerHeal:= PlayerHeal - damageMob;
          Writeln('У вас осталося ',PlayerHeal, ' Здоровья');
          GOTO z;
    until (PlayerHeal = 0) or (healMob = 0);
          if PlayerHeal > healMob then
             begin
               Writeln('Игрок одержал победу');
               Writeln('У вас: ', PlayerExp, ' опыта');
             end
          else
             begin
               Writeln(nameMob,' Одержал победу');
             end;
  end;

procedure woundedWolf();
  begin
//     Раненый Волк
// Уровень моба: низький уровень
// Здоровье: 70
// Урон 20
// Ключ моба = 4 (numberMob)
  damageMob:=20;
  healMob:=70;
  nameMob:='Раненый Волк';
  PlayerExp:= PlayerExp + 15;
  FightC();
  end;

procedure fightForestSpirit();
  begin
//     Лесной дух
// Уровень моба: средний уровень
// Здоровье: 145
// Урон: 30
// Ключ моба = 2 (numberMob)
  damageMob:=30;
  healMob:=145;
  nameMob:='Лесной дух';
  PlayerExp:= PlayerExp + 30;
  FightC();

  end;



procedure FightRabbit();
  begin
//     Обычный заец
// Уровень моба: низький уровень
// Здоровье: 50
// Урон 2
// Ключ моба = 3 (numberMob)
  damageMob:=2;
  healMob:=50;
  nameMob:='Обычный заец';
  PlayerExp:= PlayerExp + 15;
  FightC();
  
  end;

//процедура боя Игрока и Здоровго Волка
procedure FightWolf();
begin
    //**Здоровый волк**
//Уровень моба: низький 
//Здоровье: 100
//Урон 10
// Ключ моба = 1 (numberMob)
  damageMob:=10;
  healMob:=100;
  nameMob:= 'Здоровый волк';
  PlayerExp:= PlayerExp + 25;
   FightC();
end;

// процедура боя между игроком и мобом
procedure Fight();
LABEL wolf,rabbit,spirit,wounWolf;
begin
var fightComand:string;
var numberMob:integer;
//механизм случайного проттвника, отвечает за всё переменная numberMob;
//начало механизму
Randomize;
numberMob:= Random(3)+ 1;
//конец механизму
 TextColor(TextCL[7,1]);
 case numberMob of 
      1:begin 
          Writeln('Вы встретили Здорового волка');
          nameMob:= 'Здоровый волк';
          Writeln('Ваши действия:');
          wolf:
          TextColor(Green);
          Writeln('    Атаковать');
          TextColor(7);
          Writeln('    Лечиться');
          TextColor(12);
          Writeln('    Убежать (возможность убежать 50%),при неудачи будет случайный урон по игроку');
          TextColor(Yellow);
          Readln(fightComand);
          
          case fightComand of 
            'Атаковать','атаковать','атковать':
              begin
                FightWolf();        
              end;
             'Лечиться', 'лечиться':
              begin
                UpHeal();
                Writeln('Бой продолжаеться');
                GOTO wolf;
              end;
             'Убежать','убежать':
              begin
                 escape();
              end;
         end;
        end;
      3:begin
          Writeln('Вы встретили Обычного зайца');
          Writeln('Ваши действия:');
          rabbit:
          TextColor(Green);
          Writeln('    Атаковать');
          TextColor(7);
          Writeln('    Лечиться');
          TextColor(12);
          Writeln('    Убежать (возможность убежать 50%), при неудачи будет случайный урон по игроку');
          TextColor(Yellow);
          Readln(fightComand);
          
          case fightComand of
            'Атаковать','атаковать','атковать':
              begin
                FightRabbit();
              end;
              'Лечиться', 'лечиться':
              begin
                UpHeal();
                Writeln('Бой продолжаеться');
                GOTO rabbit;
              end;
              'Убежать','убежать':
              begin
                 escape();
              end;
          end;
       end;
      2:begin
          Writeln('Вы встретили Лесного духа');
          Writeln('Ваши действия:');
          spirit:
          TextColor(Green);
          Writeln('    Атаковать');
          TextColor(7);
          Writeln('    Лечиться');
          TextColor(12);
          Writeln('    Убежать (возможность убежать 50%), при неудачи будет случайный урон по игроку');
          TextColor(Yellow);
          Readln(fightComand);
          
          case fightComand of
            'Атаковать','атаковать','атковать':
              begin
                fightForestSpirit();
              end;
              'Лечиться', 'лечиться':
              begin
                UpHeal();
                Writeln('Бой продолжаеться');
                GOTO spirit;
              end;
              'Убежать','убежать':
              begin
                 escape();
              end;
              
      
          end;
       end;
      4:begin
           Writeln('Вы встретили Раненого волк');
          Writeln('Ваши действия:');
          wounWolf:
          TextColor(Green);
          Writeln('    Атаковать');
          TextColor(7);
          Writeln('    Лечиться');
          TextColor(12);
          Writeln('    Убежать (возможность убежать 50%),при неудачи будет случайный урон по игроку');
          TextColor(Yellow);
          Readln(fightComand);
          
          case fightComand of
            'Атаковать','атаковать','атковать':
              begin
                woundedWolf();
              end;
               'Лечиться', 'лечиться':
              begin
                UpHeal();
                Writeln('Бой продолжаеться');
                GOTO wounWolf;
              end;
              'Убежать','убежать':
              begin
                 escape();
              end;
      
          end;
        end;
end;
end;

procedure Cheat();
//процедура для тестировки игры
begin
  Writeln('Вы активировали чит-мод, теперь у вас 9999 очков здоровья и 9999 опыта');
  playerHeal:=9999;
  PlayerExp:= 9999;
end;

//процедура для таверны
procedure tavern();
  begin
    TextColor(TextCL[8,1]);
    Writeln('У вас: ', PlayerExp, ' опыта');
    Writeln('Товары: ');
    Writeln('      1 - Баночка улутшения для оружия стоит 20 опыта');
    Writeln('      2 - Баночка улутшения для силы стоит 5 опыта');
    Writeln('      3 - Баночки увеличения жизни');
    Writeln('      4 - Розслабляющий напиток стоит 15 опыта');
    Readln(number);
    Case number of
      1: begin
          if PlayerExp >= 20 then
            begin
              TextColor(green);
              BotleWeapon += 1;
              PlayerExp -= 20;
              Writeln('Вы купили одну баночку улутшения для оружия');
              Writeln('У вас: ', PlayerExp, ' опыта');
            end
            else
            begin
              TextColor(red);
              Writeln('У вас не хватает средств !!!');
            end;
          end;
      2: begin
          if PlayerExp >= 5 then
            begin
              TextColor(green);
              BotleDamage += 1;
              PlayerExp -= 5;
              Writeln('Вы купили одну баночку для улутшения силы');
              Writeln('У вас: ', PlayerExp, ' опыта');
            end
            else 
            begin 
              TextColor(red);
              Writeln('У вас не хватает средств !!!');
            end;
          end;
      3: begin
            Writeln('Выбирите: ');
            Writeln('      1 - Маленькая баночка: стоимость 10 опыта');
            Writeln('      2 - Средняя баночка: стоимость 20 опыта');
            Writeln('      3 - Большая баночка: стоимость 30 опыта');
            Readln(number);
            Case number of
            1: begin
                if PlayerExp >= 10 then
                  begin
                    TextColor(green);
                    BotleHeal[1] += 1;
                    PlayerExp -= 10;
                    Writeln('Вы купили одну маленькую баночку для увеличения здоровья');
                    Writeln('У вас: ', PlayerExp, ' опыта');
                  end
                  else 
                  begin
                    TextColor(red);
                    Writeln('У вас не хватает средств !!!');
                  end;
               end;
            2: begin
                if PlayerExp >= 20 then
                  begin
                    TextColor(green);
                    BotleHeal[2] += 1;
                    PlayerExp -= 20;
                    Writeln('Вы купили одну среднюю баночку для увеличения здоровья');
                    Writeln('У вас: ', PlayerExp, ' опыта');
                  end
                  else 
                  begin
                    TextColor(red);
                    Writeln('У вас не хватает средств !!!');
                  end;
               end;
             3: begin
                if PlayerExp >= 30 then
                  begin
                    TextColor(green);
                    BotleHeal[3] += 1;
                    PlayerExp -= 30;
                    Writeln('Вы купили одну большую баночку для увеличения здоровья');
                    Writeln('У вас: ', PlayerExp, ' опыта');
                  end
                  else 
                  begin
                    TextColor(red);
                    Writeln('У вас не хватает средств !!!');
                  end;
               end;
             end; 
         end;
      4: begin
          if PlayerExp >= 15 then
            begin
              TextColor(green);
              BotleWeapon += 1;
              PlayerExp -= 15;
              Writeln('Вы просто потратили опыт))');
              Writeln('У вас: ', PlayerExp, ' опыта');
            end
            else
            begin
              TextColor(red);
              Writeln('У вас не хватает средств !!!');
            end;
          end;
      end;
  end;

//процедура для смены цвета
procedure chooseColor(var x, y:integer);
  var i: integer;
  begin
  for i:= 1 to 2 do begin
  TextCL[x,i]:= y;
  end;
  end;

// процедура для выбора места приминеня цвета
Procedure SelectColor();
begin
Writeln('Где вы хотите изменить цвет?'); 
Writeln('1 - Главное меню');
Writeln('2 - Характеристики');
Writeln('3 - Инвентарь');
Writeln('4 - Оружие');
Writeln('5 - Качаться');
Writeln('6 - Лечиться');
Writeln('7 - Бой');
Writeln('8 - Таверна');
Readln(number);
Writeln('Выбирите цвет: ');
Writeln('1 - LightBlue');
Writeln('2 - Red');
Writeln('3 - Magenta');
Writeln('4 - Yellow');
Writeln('5 - LightGray');
Readln(num);
Case num of
1: begin
    num:= 9;
    chooseColor(number,num);
  end;
2: begin
    num:= 4;
    chooseColor(number,num);
    end;
3: begin
    num:= 5;
    chooseColor(number,num);
    end;
4: begin
    num:= 14;
    chooseColor(number,num);
    end;
5: begin
    num:= 7;
    chooseColor(number,num);
    end;
end;
end;

//Начальный цвет
procedure startCL();
  var i, n: integer;
  begin
    for i:= 1 to 14 do 
      begin
        if (i mod 2)=0 then
          begin
            TextCL[1, i]:= Red;
          end;
      end;
      for i:= 1 to 14 do 
      begin
        if (i mod 2) <> 0 then
          begin
            TextCL[1, i]:= White;
          end;
      end;
    TextCL[2,1]:= 7; //Характеристики
    TextCL[3,1]:= 7; //Инвентарь
    TextCL[4,1]:= 7; //Оружие
    TextCL[5,1]:= 7; //Качаться
    TextCL[6,1]:= 7; //Лечиться
    TextCL[7,1]:= Yellow; //Бой
    TextCL[8,1]:= 7; // Таверна
  end;

//процедура старту игры
procedure starting();
  begin
  startCL();
  Writeln('');
  TextColor(White);
  PlayerDamage:= 5;
  Writeln('------------------');
  Writeln('      НАЧАЛО');
  Writeln('------------------');
  Writeln('Вибирете уровень сложности:');
  Writeln('   1-легко');
  Writeln('   2-нормальна');
  Writeln('   3-тяжолоя');
end;

procedure ConsoleHelp();
begin
 TextColor(TextCL[1,1]);
 Writeln('Вся игра состоит из команд до главнои консоли');
  TextColor(TextCL[1,2]);
 Writeln('Характеристики_игрока - показывает характеристику игрока ');
  TextColor(TextCL[1,3]);
 Writeln('Инвентарь - показывает оружие и батончики которые есть в наличии');
  TextColor(TextCL[1,4]);
 Writeln('Оружие - выбор оружия');
  TextColor(TextCL[1,5]);
 Writeln('Таверна - вы здесь можете купить баночек за опыт');
  TextColor(TextCL[1,6]);
 Writeln('Качаться - увелечения урона для любого з оружий, но если есть баночек силы ');
  TextColor(TextCL[1,7]);
 Writeln('Лечиться - Востановления здоровья игрока, в зависимости от баночки');
  TextColor(TextCL[1,8]);
 Writeln('Бой - начатия боя з мобами ');
  TextColor(TextCL[1,9]);
 Writeln('Очистить - очищает екран, от всех событий(текста)');
  TextColor(TextCL[1,10]);
 Writeln('Сменить_цвет - позволяет выбрать цвет текста');
  TextColor(TextCL[1,11]);
 Writeln('Опыт - показывает текущий опыт игрока');
  TextColor(TextCL[1,12]);
 Writeln('О_программе - разроботчики игры');
  TextColor(TextCL[1,13]);
 Writeln('Не стоить запоминать все команды, если что-то забудешь напиши help в консоль');
  TextColor(TextCL[1,14]);
end;

//пороцедура для вывода содержимого инвентаря
procedure Invent();
begin
  TextColor(TextCL[3,1]);
  Writeln('Оружие: ');
  Writeln('    Меч');
  Writeln('    Кинжал');
  Writeln('Батончики: ');
  Writeln('    Количество баночек силы: ', BotleDamage);
  Writeln('    Кол-во баночек здоровья: '); 
  Writeln('           Маленькая -', BotleHeal[1]);
  Writeln('           Cредняя - ', BotleHeal[2]);
  Writeln('           Большая - ', BotleHeal[3]);
  Writeln('    Кол-во баночек силы оружия: ', BotleWeapon);
end;

//процедура для обновления показаний урона для кулаков
procedure fist();
begin
  if WeaponDamage = PlayerDamage - 1 then
    begin
      WeaponDamage:= PlayerDamage;
    end;
end;

//процедура для увеличения урона в оружия
procedure UpDamageWeap();
  begin
    TextColor(TextCL[5,1]);
    Writeln('Выбирите оружие которое вам нужно улутшить: ');
    Writeln('   Меч - ', Weapons[1], ' урона       +' , WeaponUp);
    Writeln('   Кинжал - ', Weapons[2], ' урона   + ', WeaponUp);
    Writeln('   Кулаки - ', PlayerDamage, ' урона   +1');
    Readln(PlayerComand);
    Case PlayerComand of
      'Меч': Begin 
        If BotleWeapon > 0 then
          begin
          Weapons[1] := Weapons[1] + WeaponUp;
          BotleWeapon:= BotleWeapon - 1;
          WeaponDamage := Weapons[1];
          Writeln('У вас осталося: ',BotleWeapon);
          Writeln('У  ваc характеристика: ',Weapons[1]);
          end
        else
          begin
          Writeln('У вас нет нужного снаряжения');
          end;
      end;
   'Кинжал': Begin 
        If BotleWeapon > 0 then
          begin
          Weapons[2] := Weapons[2] + WeaponUp;
          BotleWeapon:= BotleWeapon - 1;
          WeaponDamage := Weapons[1];
          Writeln('У вас осталося: ',BotleWeapon);
          Writeln('У  ваc характеристика: ',Weapons[2]);
          end
        else
          begin
          Writeln('У вас нет нужного снаряжения');
          end;
      end;
   'Кулаки': Begin
        If BotleDamage > 0 then
          begin
          PlayerDamage:=PlayerDamage  + 1;
          BotleDamage:=BotleDamage - 1;
          Writeln('У вас осталося: ',BotleDamage);
          Writeln('У  ваc характеристика: ',PlayerDamage);
          fist();
          end
        else
          begin
          Writeln('У вас нет нужного снаряжения');
          end;
          end;
    else Writeln('Ошибка');
      end;
    end;

//процедура для выбора оружия
procedure weapon();
begin
  TextColor(TextCL[4,1]);
  Writeln('Выбирите оружие: ');
  Writeln('   Меч - ', Weapons[1], 'урона');
  Writeln('   Кинжал - ', Weapons[2], ' урона');
//PlayerDamage это урон от кулаков
  Writeln('   Кулаки - ', PlayerDamage, ' урона');
  Write('Введите названия оружия: ');
  Readln(PlayerComand);
  Case PlayerComand of
    'Меч': WeaponDamage:= Weapons[1];
    'Кинжал': WeaponDamage:= Weapons[2];
    'Кулаки': WeaponDamage:= PlayerDamage;
  else Begin 
    Writeln('Вы выбрали неправильно! Автоматически установлен Меч');
    WeaponDamage:= Weapons[1];
    end;
  end;
  TextColor(Green);
  Writeln('Теперь ваш урон составляєт: ', WeaponDamage);
  Writeln('Урон при бое с противником не всегда равен точному.');
  Writeln('Может быть большим или меньшим в пределе разумного');
end; 

procedure Inp();
begin
  TextColor(10);
  Writeln('Введите команду, ',Names);
end;


// процедура выбора уровни сложности 
Procedure differ(x:integer);
begin
  case x of 
    1: begin
    TextColor(Green);
        PlayerHeal:=100;
        PlayerDamage:=30;
        PlayerExp:= 0;
        Weapons[1]:= 50;
        Weapons[2]:= 35;
        WeaponUp:= 8;
        BotleHeal[1]:= 3;
        BotleHeal[2]:= 2;
        BotleHeal[3]:= 2;
        ClrScr();
        Writeln('                       Вы выбрали легкий уровень сложности');
       end;
    2: begin
    TextColor(9);
        PlayerHeal:= 90;
        PlayerDamage:=20;
        PlayerExp:= 0;
        Weapons[1]:= 45;
        Weapons[2]:= 30;
        WeaponUp:= 5;
        BotleHeal[1]:= 2;
        BotleHeal[2]:= 1;
        BotleHeal[3]:=1;
        ClrScr();
        Writeln('                       Вы выбрали средний уровень сложности');
       end;
    3: begin
    TextColor(12);
        PlayerHeal:=70;
        PlayerDamage:=10;
        PlayerExp:= 0;
        Weapons[1]:= 40;
        Weapons[2]:= 25;
        WeaponUp:= 3;
        BotleHeal[1]:= 2;
        BotleHeal[2]:= 1;
        BotleHeal[3]:= 0;
        ClrScr();
        Writeln('                       Вы выбрали тяжолый уровень сложности');
        end;
    else
      begin
      TextColor(9);
        Writeln('                     Не правильно указано, был выбран 1 ваиант');
        PlayerHeal:=100;
        PlayerDamage:=30;
        PlayerExp:= 0;
        Weapons[1]:= 50;
        Weapons[2]:= 35;
        WeaponUp:= 8;
        BotleHeal[1]:= 3;
        BotleHeal[2]:= 2;
        BotleHeal[3]:= 2;
      end;
   end;
end;

//O programe
procedure about();
  begin
  TextColor(12);
  Writeln('                        ==============================');
  Writeln('                        =       ===       ====      ==');
  Writeln('                        =  ====  ==  ====  ==   ==   =');
  Writeln('                        =  ====  ==  ====  ==  ====  =');
  Writeln('                        =  ===   ==  ====  ==  =======');
  Writeln('                        =      ====       ===  =======');
  Writeln('                        =  ====  ==  ========  ===   =');
  Writeln('                        =  ====  ==  ========  ====  =');
  Writeln('                        =  ====  ==  ========   ==   =');
  Writeln('                        =  ====  ==  =========      ==');
  Writeln('                        ==============================');
  Writeln('');
  TextColor(White);
  Writeln('        Игра создана с помощю 2 человек: Ляшенко Ростислав и Cиренко Евгений');
  Writeln('');
  Writeln('');
  end;

//процедура для виходу
procedure conez();
begin
  exit;
end;

procedure PlayerName();
	begin
	Write('Введите имя: ');
	Readln(Names);
	Writeln('Добро пожаловать в игру ', Names, ' !');
	end;

// процедура для очистки екрана
Procedure cleanerText();
begin
  ClrScr();
end;
// процедура выбора команды, главная процедура.
procedure Comand(ComandAnswer:string);
begin
  Case ComandAnswer of 
    'help', 'Помощь', 'помощь', 'Help': ConsoleHelp();
    'Характеристики_игрока', 'характеристики_игрока','{fhfrnthbcnbrb_buhjrf','[fhfrnthbcnbrb_buhjrf':
    begin
    TextColor(TextCL[2,1]);
      Writeln('Здоровье игрока - ', PlayerHeal, ' хп');
      if WeaponDamage = 0 then
        begin
          WeaponDamage:= PlayerDamage;
        end;
      Writeln('Урон игрока - ', WeaponDamage);
    end;
     'Качаться','качаться','Rfxfnmcz','rfxfnmcz': UpDamageWeap();
     'Инвентарь','инвентарь','Bydtynfhm','bydtynfhm': Invent();
     'Таверна', 'таверна', 'Nfdthyf', 'nfdthyf': tavern();
     'Оружие', 'оружие', 'Jhe;bt', 'jhe;bt': weapon();
     'Опыт','опыт': Writeln('У вас ',PlayerExp, ' Опыта');
     'Лечиться', 'лечиться', 'Ktxbnmcz', 'ktxbnmcz': UpHeal();
     'Конец', 'конец', 'Rjytw', 'rjytw':conez();
     'Очистить', 'очистить', 'Jxbcnbnm', 'jxbcnbnm':cleanerText();
     'Сменить_цвет', 'сменить_цвет', 'Cvtybnm_wdtn', 'cvtybnm_wdtn':SelectColor();
     'Бой', 'бой', '<jq', ',jq':Fight();
     'О_программе','о_программе','J_ghjuhfvvt','j_ghjuhfvvt': about();
     'Чит':Cheat();
    else Writeln('Ошибка');
  end;
end;

// Основная программа
begin
 PlayerName();
 starting();
 Readln(diferent);
 differ(diferent);
 Writeln('                           Начнём наше путишествия');
 Writeln('');
 Writeln('                                  Oбучения');
 ConsoleHelp();
 TextColor(Green);
 Writeln('');
 Writeln('                              Обучения завершено');
 Writeln('                                    Начало'); 
 TextColor(Red);
 repeat
  Inp();
  Readln(PlayerComand);
  Comand(PlayerComand);
 until PlayerHeal < 0;
 
end.