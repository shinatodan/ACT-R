(clear-all)

(define-model countdown

(sgp :esc t :lf .05 :trace-detail high)


(chunk-type number number prev)
(chunk-type count-from start end count)

(add-dm
 (ten ISA number number ten prev nine)
 (nine ISA number number nine prev eight)
 (eight ISA number number eight prev seven)
 (seven ISA number number seven prev six)
 (six ISA number number six prev five)
 (five ISA number number five prev four)
 (four ISA number number four prev three)
 (three ISA number number three prev two)
 (two ISA number number two prev one)
 (one ISA number number one prev zero)
 (first-goal ISA count-from start ten end one))

(goal-focus first-goal)

(p start
   =goal>
      ISA         count-from
      start       =num1
      count       nil
 ==>
   =goal>
      ISA         count-from
      count       =num1
   +retrieval>
      ISA         number
      number      =num1
   )

(p decrement
   =goal>
      ISA         count-from
      count       =num1
    - end         =num1
   =retrieval>
      ISA         number
      number      =num1
      prev        =num2
 ==>
   =goal>
      ISA         count-from
      count       =num2
   +retrieval>
      ISA         number
      number      =num2
   !output!       (=num1)
   )

(p stop
   =goal>
      ISA         count-from
      count       =num
      end         =num
   =retrieval>
      ISA         number
      number      =num
 ==>
   -goal>
   !output!       (=num)
   )
)