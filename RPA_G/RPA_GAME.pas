﻿Program Rpg;
Uses Crt;
// Переменные
Var PlayerHeal,PlayerDamage, PlayerExp, WeaponDamage, WeaponUp, diferent, BotleDamage, BotleWeapon:integer;
PlayerComand, Names, ng:string;
number, num: integer;
var endProgram:boolean;
t:text;
Weapons: array[1..6] of integer;
WeaponsIN: array[1..4] of integer;
WeaponsTO: array[1..4] of integer;
BotleHeal: array[1..3] of integer;
TextCL: array[1..8, 1..16] of integer;
//глобальные перемены для моба(улучшения системы боя)
 var damageMob,healMob:integer;
 var nameMob:string;
 var decisionEscape:integer;
 
//процедура сохранения
procedure outSave();
  begin
  Write('Введите имя для сохранения: ');
  Readln(ng);
  ng += '.txt';
  assign(t, ng);
  rewrite(t);
  Writeln(t, PlayerHeal, ' ', PlayerDamage,' ',PlayerExp,' ', BotleDamage, ' ', BotleHeal[1],' ', BotleHeal[2],' ', BotleHeal[3],' ', BotleWeapon);
  Writeln(t, Weapons[1], ' ', Weapons[2], ' ', WeaponUp,' ', Names);
  Writeln(t, TextCL[2,1], ' ', TextCL[3,1], ' ', TextCL[4,1], ' ', TextCL[5,1], ' ', TextCL[6,1], ' ', TextCL[7,1], ' ', TextCL[8,1]);
  Writeln(t, TextCL[1,1], ' ',TextCL[1,2], ' ',TextCL[1,3], ' ',TextCL[2,14], ' ',TextCL[1,5], ' ',TextCL[1,6], ' ',TextCL[1,7]);
  Writeln(t, TextCL[1,8], ' ',TextCL[1,9], ' ',TextCL[1,10], ' ',TextCL[1,11], ' ',TextCL[1,12], ' ',TextCL[1,13], ' ',TextCL[1,14]);
  Writeln(t, WeaponsIN[1],' ', WeaponsIN[2],' ' ,WeaponsIN[3],' ', WeaponsIN[4],' ', WeaponsTo[1],' ', WeaponsTo[2],' ', WeaponsTo[3],' ', WeaponsTo[4]);
  Writeln(t, Weapons[3], ' ', Weapons[4], ' ' , Weapons[5], ' ', Weapons[6]);
  Writeln(t, TextCL[1,15], ' ', TextCL[1,16]);
  close(t);
  end;

//процедура загрузки
procedure inSave();
  begin
    Write('Введите имя загрузки: ');
    Readln(ng);
    ng += '.txt';
    if not fileexists(ng) then begin
      Writeln('Файл не найден');
    end
    else begin
      Assign(t, ng);
      Reset(t);
      Readln(t, PlayerHeal, PlayerDamage,PlayerExp, BotleDamage, BotleHeal[1], BotleHeal[2], BotleHeal[3], BotleWeapon);
      Readln(t, Weapons[1], Weapons[2], WeaponUp, Names);
      Readln(t, TextCL[2,1], TextCL[3,1],  TextCL[4,1],  TextCL[5,1], TextCL[6,1], TextCL[7,1], TextCL[8,1]);
      Readln(t, TextCL[1,1], TextCL[1,2], TextCL[1,3], TextCL[2,14], TextCL[1,5], TextCL[1,6], TextCL[1,7]);
      Readln(t, TextCL[1,8], TextCL[1,9], TextCL[1,10], TextCL[1,11], TextCL[1,12], TextCL[1,13], TextCL[1,14]);
      Readln(t, WeaponsIN[1], WeaponsIN[2], WeaponsIN[3], WeaponsIN[4], WeaponsTo[1], WeaponsTo[2], WeaponsTo[3], WeaponsTo[4]);
      Readln(t, Weapons[3], Weapons[4], Weapons[5]);
      Readln(t, TextCL[1,15], TextCL[1,16]);
      Close(t);
    end;
 end;

  procedure conezAndSave();
  begin
    outSave();
    Writeln('Игра окончена!!!');
    endProgram:=true;
  end;
  
 
 //процедура бега
 procedure escape();
 var ranDamage:integer; // случайный урон по игроку в попытке убежать
 begin
 Randomize;
  Writeln('Вы рeшили убежать');
  decisionEscape:=Random(2);
  if nameMob = 'Обычный заяц' then
    begin
      Writeln('Бежать от насколько слабого существа, та вы трус');
      Writeln('Вас убил бог Смелости');
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
      ranDamage:=Random(60)+10;
      PlayerHeal:=PlayerHeal - ranDamage;
      Writeln('У вас остальсь ', PlayerHeal, ' здоровья');
   end;
 end;

 // процедура для лечения
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
        PlayerHeal += 10;
        BotleHeal[1]:= BotleHeal[1] - 1;
        Writeln('У вас осталось ',BotleHeal[1]);
        Writeln('Ваша характеристика ',PlayerHeal);
        end;
  2: If BotleHeal[2] > 0 then 
        begin
        PlayerHeal += 30;
        BotleHeal[2]:= BotleHeal[2] - 1;
        Writeln('У вас осталось ',BotleHeal[2]);
        Writeln('Ваша характеристика ',PlayerHeal);
        end;
  3: If BotleHeal[3] > 0 then 
        begin
        PlayerHeal += 75;
        BotleHeal[3]:= BotleHeal[3] - 1;
        Writeln('У вас осталося ',BotleHeal[3]);
        Writeln('Ваша характеристика ',PlayerHeal);
        end;
  else Writeln('Ошибка');
  end;
end;

Procedure KamolovFrass();
  var frassNumber:integer;
  begin
    Randomize;
    frassNumber:= Random(6);

    case frassNumber of 
          0:Writeln('С такими знаниями вы не сможете стать программистами');
          1:Writeln('Настоящий программист должен понимать машинные коды');
          2:Writeln('HTML - это самый простой язык');
          3:Writeln('Не правильное выравнивания в ячейке таблицы');
          4:Writeln('Вы должны учиться помимо коледжа');
          5:Writeln('За это уже можно снять бал, если не исправиш');
     end;
  end;
// процедуры
// процедура для вызова надписей команд 
procedure FightBoss();
var trueDamage:integer;
label be;
  begin
Randomize;
be:
 if WeaponDamage = 30 then
    begin
      trueDamage:=Random(30)+5;
    end
 else if WeaponDamage = 35 then 
    begin
      trueDamage:=Random(30)+10;
    end
 else if WeaponDamage > 110 then
    begin
      trueDamage:=Random(101) + 70;
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
         Writeln('У противника осталось ', healMob, ' здоровья');
         Writeln('Он говорит вам:');
         KamolovFrass();
         if (healMob = 0) or (healMob < 0) then
           begin
              break;
           end;
          Writeln(nameMob,' атакует в ответ ');
          PlayerHeal:= PlayerHeal - damageMob;
          Writeln('У вас осталося ',PlayerHeal, ' здоровья');
          GOTO be;
    until (PlayerHeal = 0) or (healMob = 0);
          if PlayerHeal > healMob then
             begin
               Writeln('Игрок одержал победу');
               Writeln('У вас: ', PlayerExp, ' опыта');
             end
          else
             begin
               Writeln(nameMob,' одержал победу');
             end;
  end;
//Все мобы
procedure Boss();
begin
  if PlayerExp >= 400 then 
    begin
    ClrScr();
      Writeln('Вы встретили боса Адского Камолова');
      Writeln('От него не убежать');
      Writeln('Бог Смелости награждает вас');
      Writeln('Прибавка к здоровьи 200');
      PlayerHeal:=PlayerHeal + 200;
      Writeln('Также дарует свой меч');
      Writeln('Прибавка к урону 120 ');
      WeaponDamage:=WeaponDamage + 120;
      Writeln('Вам прийдёться сражаться');
      damageMob:=140;
      healMob:=400;
      nameMob:='Адский Камолов';
      PlayerExp:= PlayerExp + 200;
      FightBoss();
    end
  else
    begin
    
    end;

end;
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
 else if WeaponDamage > 110 then
    begin
      trueDamage:=Random(101) + 70;
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

procedure fightElf();
begin
//Эльф
//Уровень моба: средний уровень
//Здоровье: 127
//Урон: 46
//Ключ моба = 5 (numberMob)
  damageMob:=46;
  healMob:=127;
  nameMob:='Эльф';
  PlayerExp:= PlayerExp + 30;
  FightC();
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
  nameMob:='Обычный заяц';
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
  nameMob:= 'Большой волк';
  PlayerExp:= PlayerExp + 25;
   FightC();
end;

// процедура боя между игроком и мобом
procedure Fight();
LABEL wolf,rabbit,spirit,wounWolf,el;
begin
var fightComand:string;
var numberMob:integer;
//механизм случайного проттвника, отвечает за всё переменная numberMob;
//начало механизму
Randomize;
numberMob:= Random(5)+ 1;
//конец механизму
 TextColor(TextCL[7,1]);
 case numberMob of 
      1:begin 
          Writeln('Вы встретили Большого волка');
          nameMob:= 'Большой волк';
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
            'Атаковать','атаковать','атковать', 'fnfrjdfnm', 'Fnfrjdfnm':
              begin
                FightWolf();        
              end;
             'Лечиться', 'лечиться', 'ktxbnmcz', 'Ktxbnmcz', 'Лечится', 'лечится':
              begin
                UpHeal();
                Writeln('Бой продолжаеться');
                GOTO wolf;
              end;
             'Убежать','убежать', 'e,t;fnm', 'E,t;fnm':
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
            'Атаковать','атаковать','атковать', 'fnfrjdfnm', 'Fnfrjdfnm':
              begin
                FightRabbit();
              end;
              'Лечиться', 'лечиться', 'ktxbnmcz', 'Ktxbnmcz', 'Лечится', 'лечится':
              begin
                UpHeal();
                Writeln('Бой продолжаеться');
                GOTO rabbit;
              end;
              'Убежать','убежать', 'e,t;fnm', 'E,t;fnm':
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
            'Атаковать','атаковать','атковать', 'fnfrjdfnm', 'Fnfrjdfnm':
              begin
                fightForestSpirit();
              end;
              'Лечиться', 'лечиться', 'ktxbnmcz', 'Ktxbnmcz', 'Лечится', 'лечится':
              begin
                UpHeal();
                Writeln('Бой продолжаеться');
                GOTO spirit;
              end;
              'Убежать','убежать', 'e,t;fnm', 'E,t;fnm':
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
            'Атаковать','атаковать','атковать', 'fnfrjdfnm', 'Fnfrjdfnm':
              begin
                woundedWolf();
              end;
               'Лечиться', 'лечиться', 'ktxbnmcz', 'Ktxbnmcz', 'Лечится', 'лечится':
              begin
                UpHeal();
                Writeln('Бой продолжаеться');
                GOTO wounWolf;
              end;
             'Убежать','убежать', 'e,t;fnm', 'E,t;fnm':
              begin
                 escape();
              end;
      
          end;
        end;
      5:begin
          Writeln('Вы встретили Эльфа');
          Writeln('Ваши действия:');
          el:
          TextColor(Green);
          Writeln('    Атаковать');
          TextColor(7);
          Writeln('    Лечиться');
          TextColor(12);
          Writeln('    Убежать (возможность убежать 50%),при неудачи будет случайный урон по игроку');
          TextColor(Yellow);
          Readln(fightComand);
          
          case fightComand of
            'Атаковать','атаковать','атковать', 'fnfrjdfnm', 'Fnfrjdfnm':
              begin
                woundedWolf();
              end;
               'Лечиться', 'лечиться', 'ktxbnmcz', 'Ktxbnmcz', 'Лечится', 'лечится':
              begin
                UpHeal();
                Writeln('Бой продолжаеться');
                GOTO el;
              end;
              'Убежать','убежать', 'e,t;fnm', 'E,t;fnm':
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
var a,b:integer;
  Writeln('Вы активировали чит-мод');
  Writeln('Введите сколько хотите здоровья');
  Readln(a);
  playerHeal:=a;
  Writeln('Введите сколько хотите опыта');
  TextColor(LightGray);
  Writeln('Вводить число только до 399');
  TextColor(10);
  Readln(b);
  PlayerExp:=b;
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
    writeln('      5 - Оружие');
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
              Writeln('Вы купили одну баночку для улучшения силы');
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
              else begin 
                    TextColor(Red);
                    Writeln('Вы неправильно ввели ((');
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
          5: begin
         Writeln('Выберете что хотите купить:');
         if WeaponsTO[1] > 0 then begin
         TextColor(Red);
         Writeln('  1 - Пушка:        урон ', Weapons[3], ', стоимость 65 опыта');
         TextColor(7);
         end
         else begin
           TextColor(7);
           Writeln('  1 - Пушка:        урон ', Weapons[3], ', стоимость 65 опыта');
         end;
         
         if WeaponsTO[2] > 0 then begin
          TextColor(Red);
          Writeln('  2 - Винтовка:     урон ', Weapons[4], ', стоимость 80 опыта');
          TextColor(7);
         end
         else begin
           TextColor(7);
           Writeln('  2 - Винтовка:     урон ', Weapons[4], ', стоимость 80 опыта');
         end;
         if WeaponsTO[3] > 0 then begin
           TextColor(Red);
           Writeln('  3 - Катана:       урон ', Weapons[5], ', стоимость 50 опыта');
           TextColor(7);
         end
         else begin
           TextColor(7);
           Writeln('  3 - Катана:       урон ', Weapons[5], ', стоимость 50 опыта');
         end;
         if WeaponsTO[4] > 0 then begin
           TextColor(Red);
           Writeln('  4 - Лазерный меч: урон ', Weapons[6], ', стоимость 90 опыта');
           TextColor(7);
         end
         else begin
           TextColor(7);
           Writeln('  4 - Лазерный меч: урон ', Weapons[6], ', стоимость 90 опыта');
         end;
         Readln(number);
         case number of 
           1:begin if PlayerExp >= 65 then begin
             TextColor(green);
             PlayerExp -= 65;
             WeaponsIN[1] += 1;
             WeaponsTO[1] += 1;
             Writeln('Вы купили пушку!');
             Writeln('У вас: ', PlayerExp, ' опыта');
             end
             else begin
               TextColor(red);
               Writeln('У вас не хватает средств !!!');
             end;
           end;
           2:begin if PlayerExp >= 80 then begin
             TextColor(green);
             PlayerExp -= 80;
             WeaponsIN[2] += 1;
             WeaponsTO[2] += 1;
             Writeln('Вы купили винтовку!');
             Writeln('У вас: ', PlayerExp, ' опыта');
             end
             else begin
               TextColor(red);
               Writeln('У вас не хватает средств !!!');
             end;
           end;
           3:begin if PlayerExp >= 50 then begin
             TextColor(green);
             PlayerExp -= 50;
             WeaponsIN[3] += 1;
             WeaponsTO[3] += 1;
             Writeln('Вы купили катану!');
             Writeln('У вас: ', PlayerExp, ' опыта');
             end
             else begin
               TextColor(red);
               Writeln('У вас не хватает средств !!!');
             end;
           end;
           4:begin if PlayerExp >= 90 then begin
             TextColor(green);
             PlayerExp -= 90;
             WeaponsIN[4] += 1;
             WeaponsTO[4] += 1;
             Writeln('Вы купили лазерный меч!');
             Writeln('У вас: ', PlayerExp, ' опыта');
             end
             else begin
               TextColor(red);
               Writeln('У вас не хватает средств !!!');
             end;
           end;
         end;
       end;
      else begin 
              TextColor(Red);
              Writeln('Вы неправильно ввели ((');
           end;
      end;
  end;

//процедура для смены цвета
procedure chooseColor(var x, y:integer);
  var i: integer;
  begin
    for i:= 1 to 16 do begin
    TextCL[x,i]:= y;
  end;
end;
  
procedure SelectColor();
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

// Theame
procedure Theame();
var i: integer;
	begin
		Writeln('Что вы хотите изменить: ');
		Writeln('   1 - Тему');
		Writeln('   2 - Сменить цвет одельной вкладки');
		Readln(number);
		Case number of
			1: begin
				Writeln('Выберете тему:');
				Writeln('   1 - White and Red');
				Writeln('   2 - LightRed and LightCyan');
        Writeln('   3 - Green and LightCyan');
				Readln(number);
				Case number of 
					1: Begin
    					for i:= 1 to 16 do 
      				begin
        					if (i mod 2)=0 then
          				begin
            				TextCL[1, i]:= Red;
          				end;
      				end;
      				for i:= 1 to 16 do 
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
  					2: Begin
  					   for i:= 1 to 16 do 
      				begin
        					if (i mod 2)=0 then
          				begin
            				TextCL[1, i]:= 13;
          				end;
      				end;
      				for i:= 1 to 16 do 
      					begin
        					if (i mod 2) <> 0 then
          				begin
            				TextCL[1, i]:= 11;
         			   end;
     					 end; 
    						TextCL[2,1]:= 3; //Характеристики
    						TextCL[3,1]:= 3; //Инвентарь
    						TextCL[4,1]:= 3; //Оружие
    						TextCL[5,1]:= 3; //Качаться
    						TextCL[6,1]:= 3; //Лечиться
    						TextCL[7,1]:= Yellow; //Бой
    						TextCL[8,1]:= 3; // Таверна
  					end;
            3: Begin
               for i:= 1 to 16 do 
              begin
                  if (i mod 2)=0 then
                  begin
                    TextCL[1, i]:= 2;
                  end;
              end;
              for i:= 1 to 16 do 
                begin
                  if (i mod 2) <> 0 then
                  begin
                    TextCL[1, i]:= 11;
                 end;
               end; 
                TextCL[2,1]:= 15; //Характеристики
                TextCL[3,1]:= 15; //Инвентарь
                TextCL[4,1]:= 15; //Оружие
                TextCL[5,1]:= 15; //Качаться
                TextCL[6,1]:= 15; //Лечиться
                TextCL[7,1]:= Yellow; //Бой
                TextCL[8,1]:= 15; // Таверна
            end;
            else Writeln('Вы не правильно ввели ((');
					end;
	end;
	2: SelectColor();
  else begin 
              TextColor(Red);
              Writeln('Вы неправильно ввели ((');
       end;
end;
end;
// процедура для выбора места приминеня цвета


//Начальный цвет
procedure startCL();
  var i: integer;
  begin
    for i:= 1 to 16 do 
      begin
        if (i mod 2)=0 then
          begin
            TextCL[1, i]:= Red;
          end;
      end;
      for i:= 1 to 16 do 
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
  Writeln('   1 - легкий');
  Writeln('   2 - нормальный');
  Writeln('   3 - тяжёлый');
end;

procedure ConsoleHelp();
begin
 TextColor(TextCL[1,1]);
 Writeln('Вся игра состоит из команд до главнои консоли');
  TextColor(TextCL[1,2]);
 Writeln('Характеристики_игрока - показывает характеристику игрока ');
  TextColor(TextCL[1,3]);
 Writeln('Инвентарь - показывает оружие и баночки которые есть в наличии');
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
 Writeln('Интерфейс - позволяет выбрать цвет текста');
  TextColor(TextCL[1,11]);
 Writeln('Опыт - показывает текущий опыт игрока');
  TextColor(TextCL[1,12]);
 Writeln('О_программе - разроботчики игры');
  TextColor(TextCL[1,13]);
 Writeln('Не стоить запоминать все команды, если что-то забудешь напиши help в консоль');
  TextColor(TextCL[1,14]);
 Writeln('Сохранить - сохранить собственый процес');
  TextColor(TextCL[1,15]);
 Writeln('Загрузить - загрузить собственый процес');
  TextColor(TextCL[1,16]);
  Writeln('Прощай - закрыть программу и сохранить прогресс');
end;

//пороцедура для вывода содержимого инвентаря
procedure Invent();
begin
  TextColor(TextCL[3,1]);
  Writeln('Оружие: ');
  Writeln('    Меч');
  Writeln('    Кинжал');
  If WeaponsIN[1] > 0 then begin
  Writeln('    Пушка')
  end;
  If WeaponsIN[2] > 0 then begin
  Writeln('    Винтовка')
  end;
  If WeaponsIN[3] > 0 then begin
  Writeln('    Катана')
  end;
  If WeaponsIN[4] > 0 then begin
  Writeln('    Лазерный меч')
  end;
  Writeln('Баночки: ');
  Writeln('    Количество баночек силы: ', BotleDamage);
  Writeln('    Кол-во баночек здоровья: '); 
  Writeln('           Маленькая - ', BotleHeal[1]);
  Writeln('           Cредняя -  ', BotleHeal[2]);
  Writeln('           Большая -  ', BotleHeal[3]);
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
    Writeln('   Меч - ', Weapons[1], ' урона        +',WeaponUp);
    Writeln('   Кинжал - ', Weapons[2], ' урона     +',WeaponUp);
    Writeln('   Кулаки - ', PlayerDamage, ' урона     +1');
    Writeln('   Пушка - ', Weapons[3], ' урона           +',WeaponUp);
    Writeln('   Винтовка - ', Weapons[4], ' урона        +',WeaponUp);
    Writeln('   Катана - ', Weapons[5], ' урона          +',WeaponUp);
    Writeln('   Лазерный меч - ', Weapons[6], ' урона    +',WeaponUp);
    Readln(PlayerComand);
    Case PlayerComand of
      'Меч', 'меч', 'vtx', 'Vtx': Begin 
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
   'Кинжал', 'кинжал', 'rby;fk', 'Rby;fk': Begin 
        If BotleWeapon > 0 then
          begin
          Weapons[2] := Weapons[2] + WeaponUp;
          BotleWeapon:= BotleWeapon - 1;
          WeaponDamage := Weapons[2];
          Writeln('У вас осталося: ',BotleWeapon);
          Writeln('Ваша характеристика: ',Weapons[2]);
          end
        else
          begin
          Writeln('У вас нет нужного снаряжения');
          end;
      end;
   'Кулаки', 'кулаки', 'rekfrb', 'Rekfrb': Begin
        If BotleDamage > 0 then
          begin
          PlayerDamage:=PlayerDamage  + 1;
          BotleDamage:=BotleDamage - 1;
          Writeln('У вас осталося: ',BotleDamage);
          Writeln('Ваша характеристика: ',PlayerDamage);
          fist();
          end
        else
          begin
          Writeln('У вас нет нужного снаряжения');
          end;
          end;
       'Пушка', 'пушка', 'Geirf', 'geirf': Begin 
        If BotleWeapon > 0 then
          begin
          Weapons[3] := Weapons[3] + WeaponUp;
          BotleWeapon:= BotleWeapon - 1;
          WeaponDamage := Weapons[3];
          Writeln('У вас осталося: ',BotleWeapon);
          Writeln('Ваша характеристика: ',Weapons[3]);
          end
        else
          begin
          Writeln('У вас нет нужного снаряжения');
          end;
      end;
      'Винтовка', 'винтовка', 'Dbynjdrf', 'dbynjdrf': Begin 
        If BotleWeapon > 0 then
          begin
          Weapons[4] := Weapons[4] + WeaponUp;
          BotleWeapon:= BotleWeapon - 1;
          WeaponDamage := Weapons[4];
          Writeln('У вас осталося: ',BotleWeapon);
          Writeln('Ваша характеристика: ',Weapons[4]);
          end
        else
          begin
          Writeln('У вас нет нужного снаряжения');
          end;
      end;
      'Катана', 'катана', 'Rfnfyf', 'rfnfyf': Begin 
        If BotleWeapon > 0 then
          begin
          Weapons[5] := Weapons[5] + WeaponUp;
          BotleWeapon:= BotleWeapon - 1;
          WeaponDamage := Weapons[5];
          Writeln('У вас осталося: ',BotleWeapon);
          Writeln('Ваша характеристика: ',Weapons[5]);
          end
        else
          begin
          Writeln('У вас нет нужного снаряжения');
          end;
      end;
      'Лазерный меч', 'лазерный меч', 'Kfpthysq vtx', 'kfpthysq vtx': Begin 
        If BotleWeapon > 0 then
          begin
          Weapons[6] := Weapons[6] + WeaponUp;
          BotleWeapon:= BotleWeapon - 1;
          WeaponDamage := Weapons[6];
          Writeln('У вас осталося: ',BotleWeapon);
          Writeln('Ваша характеристика: ',Weapons[6]);
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
var command:integer;
begin
  TextColor(TextCL[4,1]);
  Writeln('Выбирите оружие: ');
  Writeln('  1. Меч - ', Weapons[1], ' урона');
  Writeln('  2. Кинжал - ', Weapons[2], ' урона');
//PlayerDamage это урон от кулаков
  Writeln('  3. Кулаки - ', PlayerDamage, ' урона');
  if WeaponsIN[1] <= 0 then begin
    TextColor(Red);
    Writeln('  4. Пушка - ', Weapons[3],' урона');
  end
  else begin
    TextColor(TextCL[4,1]);
    Writeln('  4. Пушка - ', Weapons[3],' урона');
  end;
  if WeaponsIN[2] <= 0 then begin
    TextColor(Red);
    Writeln('  5. Винтовка - ', Weapons[4],' урона');
  end
  else begin
    TextColor(TextCL[4,1]);
    Writeln('  5. Винтовка - ', Weapons[4],' урона');
  end;
  if WeaponsIN[3] <= 0 then begin
    TextColor(Red);
    Writeln('  6. Катана - ', Weapons[5],' урона');
  end
  else begin
    TextColor(TextCL[4,1]);
    Writeln('  6. Катана - ', Weapons[5],' урона');
  end;
  if WeaponsIN[4] <= 0 then begin
    TextColor(Red);
    Writeln('  7. Лазерный меч - ', Weapons[6],' урона');
  end
  else begin
    TextColor(TextCL[4,1]);
    Writeln('  7. Лазерный меч - ', Weapons[6],' урона');
  end;
  TextColor(TextCL[4,1]);
  Write('Введите названия оружия: ');
  Readln(command);
  Case command of
    1: WeaponDamage:= Weapons[1];
    2: WeaponDamage:= Weapons[2];
    3: WeaponDamage := PlayerDamage;
    4: begin
      If WeaponsIN[1] > 0 then begin
        WeaponDamage:= Weapons[3]; 
        end
        else begin
          Writeln('Вы выбрали неправильно! Автоматически установлены кулаки');
          WeaponDamage := PlayerDamage;
          end
    end;
    5:begin
      If WeaponsIN[2] > 0 then begin
        WeaponDamage:= Weapons[4]; 
        end
        else begin
          Writeln('Вы выбрали неправильно! Автоматически установлены кулаки');
          WeaponDamage := PlayerDamage;
          end
    end;
    6:begin
      If WeaponsIN[3] > 0 then begin
        WeaponDamage:= Weapons[5]; 
        end
        else begin
          Writeln('Вы выбрали неправильно! Автоматически установлены кулаки');
          WeaponDamage := PlayerDamage;
          end
    end;
    7:begin
      If WeaponsIN[4] > 0 then begin
        WeaponDamage:= Weapons[6]; 
        end
        else begin
          Writeln('Вы выбрали неправильно! Автоматически установлены кулаки');
          WeaponDamage := PlayerDamage;
          end
    end;
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
        PlayerDamage:=25;
        PlayerExp:= 0;
        Weapons[1]:= 45;
        Weapons[2] := 30;
        Weapons[3] := 60;
        Weapons[4] := 76;
        Weapons[5] := 48;
        Weapons[6] := 91;
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
        Weapons[1]:= 39;
        Weapons[2] := 25;
        Weapons[3] := 55;
        Weapons[4] := 69;
        Weapons[5] := 43;
        Weapons[6] := 85;
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
        Weapons[1]:= 30;
        Weapons[2] := 25;
        Weapons[3] := 35;
        Weapons[4] := 48;
        Weapons[5] := 29;
        Weapons[6] := 79;
        WeaponUp:= 3;
        BotleHeal[1]:= 2;
        BotleHeal[2]:= 1;
        BotleHeal[3]:= 0;
        ClrScr();
        Writeln('                       Вы выбрали тяжёлый уровень сложности');
        end;
    else
      begin
      TextColor(9);
        Writeln('                     Не правильно указано, был выбран 1 вариант');
        PlayerHeal:=100;
        PlayerDamage:=30;
        PlayerExp:= 0;
        Weapons[1]:= 50;
        Weapons[2] := 35;
        Weapons[3] := 60;
        Weapons[4] := 76;
        Weapons[5] := 48;
        Weapons[6] := 91;
        WeaponUp:= 8;
        BotleHeal[1]:= 3;
        BotleHeal[2]:= 2;
        BotleHeal[3]:= 2;
      end;
   end;
end;


//about programe
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
  Writeln('        Игра создана с помощю 2 человек: Ляшенко Ростислав и Cиренко Евгения');
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
    'help', 'Помощь', 'помощь', 'Help', 'Меню', 'меню': ConsoleHelp();
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
     'Интерфейс', 'интерфейс', 'Bynthatqc', 'bynthatqc': Theame();
     'Бой', 'бой', '<jq', ',jq':Fight();
     'Save', 'Сохранить', 'сохранить', 'Cj[hfybnm', 'cj[hfybnm': outSave();
     'Input','Загрузить','загрузить','pfuhepbnm','Pfuhepbnm': inSave();
     'О_программе','о_программе','J_ghjuhfvvt','j_ghjuhfvvt': about();
     'Чит', 'чит':Cheat();
     'Прощай','прощай','ghjofq','Ghjofq':conezAndSave();
    else TextColor(red);
         Writeln('Ошибка');
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
  Boss();
  Inp();
  Readln(PlayerComand);
  Comand(PlayerComand);
  if endProgram = true then
    begin
      exit;
    end;
 until PlayerHeal < 0;
 exit;
end.