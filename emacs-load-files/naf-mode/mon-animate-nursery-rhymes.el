;; -*- mode: EMACS-LISP; -*-
;;; this is mon-animate-nursery-rhymes.el
;;; ================================================================
;;; DESCRIPTION:
;;; mon-animate-nursery-rhymes provides a list of nursery rhymes.
;;; Can be extened for use as a fun session startup animation.
;;;
;;; FUNCTIONS:▶▶▶
;;; 
;;; FUNCTIONS:◀◀◀
;;;
;;; MACROS:
;;;
;;; METHODS:
;;;
;;; CLASSES:
;;;
;;; CONSTANTS:
;;;
;;; VARIABLES:
;;;
;;; ALIASED/ADVISED/SUBST'D:
;;;
;;; DEPRECATED:
;;;
;;; RENAMED:
;;;
;;; MOVED:
;;;
;;; TODO:
;;;
;;; NOTES:
;;;
;;; SNIPPETS:
;;;
;;; REQUIRES:
;;;
;;; THIRD-PARTY-CODE:
;;;
;;; AUTHOR: MON KEY
;;; MAINTAINER: MON KEY
;;;
;;; PUBLIC-LINK: (URL `http://www.emacswiki.org/emacs/mon-animate-nursery-rhymes.el')
;;; FIRST-PUBLISHED:
;;;
;;; FILE-CREATED:
;;; <Timestamp: #{2010-01-18T12:22:40-05:00Z}#{10031} - by MON KEY>
;;; ================================================================
;;; This file is not part of GNU Emacs.
;;;
;;; This program is free software; you can redistribute it and/or
;;; modify it under the terms of the GNU General Public License as
;;; published by the Free Software Foundation; either version 3, or
;;; (at your option) any later version.
;;;
;;; This program is distributed in the hope that it will be useful,
;;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;;; General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with this program; see the file COPYING.  If not, write to
;;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth
;;; Floor, Boston, MA 02110-1301, USA.
;;; ================================================================
;;; Permission is granted to copy, distribute and/or modify this
;;; document under the terms of the GNU Free Documentation License,
;;; Version 1.3 or any later version published by the Free Software
;;; Foundation; with no Invariant Sections, no Front-Cover Texts,
;;; and no Back-Cover Texts. A copy of the license is included in
;;; the section entitled "GNU Free Documentation License".
;;; A copy of the license is also available from the Free Software
;;; Foundation Web site at:
;;; (URL `http://www.gnu.org/licenses/fdl-1.3.txt').
;;; ================================================================
;; Copyright © 2010-2024 MON KEY 
;;; ==============================
;;; CODE:

(eval-when-compile (require 'cl)
                   (require 'animate))

;;; ==============================
;;; :CREATED <Timestamp: #{2010-01-18T12:16:41-05:00Z}#{10031} - by MON KEY>
(defvar *mon-nursery-rhymes* nil
  "List of nursery rhymes for use with `mon-animate-nursery-rhyme'.\n 
Converted from material sourced \(mostly\) from content from available at:
:SEE (URL `http://www.rhymes.org.uk/')
:SEE (URL `http://www.gutenberg.org/files/24271/24271.txt')\n
:SEE-ALSO .\n▶▶▶")
;;
(unless (bound-and-true-p *mon-nursery-rhymes*)
  (setq *mon-nursery-rhymes*
        '(("There was a MON-KEY climbed up a tree;"
           "When he fell down, then down fell he.")
          ;;
          ("Little Blue Betty lived in a lane, "
           "She sold good ale to gentlemen:"
           "Gentlemen came every day,"
           "And Little Blue Betty hopped away;"
           "She hopped upstairs to make her bed,"
           "And she tumbled down, and broke her head.") 
          ;;
          ("There was an old woman, as I 've heard tell,"
           "She went to market her eggs for to sell;"
           "She went to market all on a market day, "
           "And she fell asleep on the King's highway.\n"
           "There came by a pedlar, whose name was Stout,"
           "He cut her petticoats all round about; "
           "He cut her petticoats up to the knees,"
           "Which made the old woman to shiver and freeze."
           "When the little old woman first did wake, "
           "She began to shiver and she began to shake; "
           "She began to wonder, and she began to cry, "
           "Lauk a mercy on me, this can't be I!")
          ;;              
          ("Three wise men of Gotham"
           "Went to sea in a bowl;"
           "If the bowl had been stronger "
           "My story had been longer.")
          ;;
          ("Barber, barber, shave a pig!"
           "How many hairs to make a wig"
           "Four and twenty, that's enough!"
           "Give the barber a pinch of snuff.")
          ;;
          ("Hey diddle diddle,"
           "The cat and the fiddle,"
           "The cow jumped over the moon,"
           "The little dog laughed to see such sport,"
           "And the dish ran away with the spoon.")
          ;;
          ("Humptey Dumptey sat on a wall,"
           "Humptey Dumptey had a great fall;"
           "All the King's horses and all the King's men,"
           "Couldn't put Humptey together again.")
          ;;
          ("Hickory dickory dock,"
           "The mouse ran up the clock."
           "The clock struck one,"
           "And down he run,"
           "Hickory dickory dock.")
          ;;
          ("Little Jack Horner"
           "Sat in a corner"
           "Eating his Christmas pie;"
           "He put in his thumb"
           "And pulled out a plum,"
           "And said, What a good boy am I!")
          ;;
          ("Sing a sang o' saxpence,"
           "A baggie fu' o' rye,"
           "Four-and-twenty blackbirds,"
           "Bakit in a pie."
           "When the pie was opened"
           "The birds began to sing;"
           "And wasna that a dainty dish"
           "To set before the King?"
           "The king was in his counting house,"
           "Counting out his money,"
           "The queen was in the parlour,"
           "Eating bread and honey"
           "The maid was in the garden,"
           "Hanging out the clothes,"
           "When down came a blackbird," 
           "And pecked off her nose!")
          ;;
          ("Hark hark the dogs do bark"
           "The beggars are coming to town"
           "Some in rags and some in jags"
           "And one in a velvet gown.")
          ;;
          ("Ride a cock horse to Banbury Cross"
           "To see a fine lady upon a white horse"
           "With rings on her fingers and bells on her toes"
           "She shall have music wherever she goes")
          ;;
          ("Georgie Porgie pudding and pie,"
           "Kissed the girls and made them cry"
           "When the boys came out to play,"
           "Georgie Porgie ran away.") 
          ;;
          ("There was a crooked man and he walked a crooked mile,"
           "He found a crooked sixpence upon a crooked stile."
           "He bought a crooked cat, which caught a crooked mouse."
           "And they all lived together in a little crooked house")              
          ;;              
          ("The Grand old Duke of York he had ten thousand men"
           "He marched them up to the top of the hill"
           "And he marched them down again."
           "When they were up, they were up"
           "And when they were down, they were down"
           "And when they were only halfway up"
           "They were neither up nor down.")
          ;;
          ("The time has come, the Walrus said,"
           "To talk of many things:"
           "Of shoes and ships and sealing-wax,"
           "Of cabbages and kings"
           "And why the sea is boiling hot "
           "And whether pigs have wings.")
          ;;
          ("A laird, a lord,"
           "A rich man, a thief,"
           "A tailor, a drummer,"
           "A stealer o' beef.")
          ;;
          ("I got a little manikin, I set him on my thoomiken;"
           "I saddled him, I bridled him, I sent him to the tooniken:"
           "I coffed a pair o' garters to tie his little hosiken;"
           "I coffed a pocket-napkin to dight his little nosiken;"
           "I sent him to the garden to fetch a pund o' sage"
           "And found him in the kitchen-neuk kissing little Madge.")
          ;;
          ("I had a little pony,"
           "  Its name was Dapple Grey:"
           "I lent it to a lady,"
           "  To ride a mile away."
           "She whipped it, she lashed it,"
           "  She ca'd it owre the brae;"
           "I winna lend my pony mair,"
           "  Though a' the ladies pray.")
          ;;
          ("Jack and Jill"
           "  Went up the hill"
           "To fetch a pail of water;"
           "  Jack fell down"
           "  And broke his crown,"
           "And Jill came tumbling after.")
          ;;
          ("Baa, baa, black sheep, have you any wool?"
           "Yes, sir, yes, sir, three bags full;"
           "One for the master, one for the dame,"
           "One for the little boy that lives in the lane.")
          ;;
          ("Tom, Tom, the piper's son,"
           "  Stole a pig and away he run;"
           "  Pig was eat, and Tom was beat,"
           "  And Tom went roaring down the street.")
          ;;
          ("Little Betty Blue"
           "Has lost her holiday shoe,"
           "  Give her another"
           "  To match the other,"
           "And then she will walk in two.")
          ;;
          ("Three blind mice; three blind mice;"
           "See how they run; see how they run;"
           "They all ran after the farmer's wife,"
           "Who cut off their tails with a carving knife,"
           "Did ever you see such fools in your life?"
           "    Three blind mice!")
          ;;
          ("  Mary, Mary,"
           "  Quite contrairy,"
           "How does your garden grow?"
           "  Silver bells,"
           "  And cockle shells,"
           "And pretty-maids all in a row.")
          ;;
          ("Pat-a-cake, pat-a-cake, baker's man!"
           "Bake a cake as fast as you can;"
           "Prick it, and pat it, and mark it with T,"
           "And put it in the oven for Tommy and me.")
          ;;
          ("  Little Miss Muffet"
           "  Sat on a tuffet,"
           "Eating her curds and whey;"
           "  There came a great spider"
           "  And sat down beside her,"
           "And frightened Miss Muffet away.")
          ;;
          ("Jack Sprat could eat no fat,"
           "  His wife could eat no lean;"
           "And so, betwixt them both, you see,"
           "  They licked the platter clean.")
          ;;
          ("Little Tom Tucker"
           "Sang for his supper."
           "What shall we give him?"
           "Brown bread and butter."
           "How shall he cut it"
           "Without any a knife?"
           "How shall he marry"
           "Without any wife?")
          ;;
          ("See-saw, Margery Daw,"
           "  Jenny shall have a new master;"
           "She shall have but a penny a day,"
           "  Because she can't work any faster.")
          ;;
          ("Roun', roun' rosie, cuppie, cuppie shell,"
           "  The dog's awa' to Hamilton, to buy a new bell;"
           "If you don't tak' it, I'll tak' it to mysel',"
           "  Roun', roun' rosie, cuppie, cuppie shell.")
          ;;
          ("There was a little man, and he had a little gun,"
           "  And his bullets were made of lead, lead, lead;"
           "He shot Johnnie Twig through the middle of his wig,"
           "  And knocked it right off his head, head, head.")
          ;;
          ("Hickety, pickety, my black hen,"
           "Lays eggs for gentlemen,"
           "Whiles ane, whiles twa,"
           "Whiles a bonnie black craw.")
          ;;
          ("There was an old woman who lived in a shoe,"
           "She had so many children, she didn't know what to do;"
           "She gave them some broth, without any bread,"
           "And whipped them all soundly and put them to bed.")
          ;;
          ("Doctor Foster, went to Glo'ster"
           "  In a shower of rain;"
           "He stepped in a puddle,"
           "Up to the middle,"
           "  And never went there again.")
          ;;
          ("Ding, dong, bell, Pussy's in the well."
           "  Who put her in? Little Tommy Thin."
           "  Who pulled her out? Little Tommy Stout."
           "      What a naughty boy was that,"
           "      Thus to drown poor Pussy Cat.")
          ;;
          ("Little Boy Blue, come, blow your horn,"
           "The sheep's in the meadow, the cow's in the corn;"
           "Where is the boy that looks after the sheep?"
           "He's under the haycock, fast asleep!")
          ;;              
          ("Bye, baby bunting,"
           "Father's gone a-hunting,"
           "Mother's gone a-milking,"
           "Sister's gone a-silking,"
           "Brother's gone to buy a skin"
           "To wrap the baby bunting in.")
          ;;
          ("John Cook he had a little grey mare,"
           "hee, haw, hum;"
           "Her legs were long and her back was bare,"
           "hee, haw, hum.\n"
           "John Cook was riding up Shooter's Bank,"
           "hee, haw, hum;"
           "The mare she began to kick and to prank,"
           "hee, haw, hum.\n"
           "John Cook was riding up Shooter's Hill,"
           "hee, haw, hum;"
           "His mare fell down and made her will,"
           "hee, haw, hum.\n"
           "The bridle and saddle were laid on the shelf,"
           "hee, haw, hum;"
           "If you want any more, you may sing it yourself,"
           "hee, haw, hum.")
          ;;
          ("Old King Cole"
           "Was a merry old soul,"
           "And a merry old soul was he;"
           "And he called for his pipe"
           "And he called for his glass,"
           "And he called for his fiddlers three!")
          ;;
          ("\"You might just as well say,\" added the Dormouse, which seemed to be"
           "talking in its sleep, \"that 'I breathe when I sleep' is the same thing"
           "as 'I sleep when I breathe!'\"")
          ;;
          ("Speak roughly to your little boy,"
           "  And beat him when he sneezes:"
           "He only does it to annoy,"
           "  Because he knows it teases."
           "I speak severely to my boy,"
           "  I beat him when he sneezes;"
           "For he can thoroughly enjoy"
           "  The pepper when he pleases!")
          ;;
          ("There was an old woman,"
           "Lived under a hill.\n"
           "And if she's not gone,"
           "She lives there still.")
          ;;
          ("Taffy was a Welshman, Taffy was a thief,"
           "Taffy came to my house, and stole a piece of beef;"
           "I went to Taffy's house, Taffy was not at home;"
           "Taffy came to my house, and stole a marrow-bone."
           "I went to Taffy's house, Taffy was in bed,"
           "I took up a broomstick and flung it at his head.")
          ;;
          ("The lion and the unicorn"
           "  Fighting for the crown;"
           "Up jumps a wee dog"
           "  And knocks them both down."
           "Some got white bread,"
           "  And some got brown:"
           "But the lion beat the unicorn"
           "  All round the town.")
          ;;
          ("There was a wee wifie row'd up in a blanket,"
           "  Nineteen times as high as the moon;"
           "And what she did there I canna declare,"
           "  For in her oxter she bure the sun."
           "Wee wifie, wee wifie, wee wifie, quo' I,"
           "  O what are ye doin' up there so high?"
           "I'm blawin' the cauld clouds out o' the sky."
           "  Weel dune, weel dune, wee wifie, quo' I.")
          ;;
          ("The laverock and the lintie,"
           "  The robin and the wren;"
           "Gin ye harry their nests,"
           "  Ye'll never thrive again.")
          ;;
          ("Rainy, rainy rattle-stanes,"
           "  Dinna rain on me;"
           "But rain on Johnnie Groat's House,"
           "  Far owre the sea.")
          ;;
          ("Half a puddock, half a taed,"
           "  Half a yellow yorling;"
           "Drinks a drap o' the deil's blood"
           "  Every May morning.")
          ;;
          ("  Larikie, larikie, lee!"
           "Wha'll gang up to heaven wi' me?"
           "No the lout that lies in his bed,"
           "No the doolfu' that dreeps his head.")
          ;;
          ("The cuckoo is a bonnie bird,"
           "  He sings as he flies;"
           "He brings us good tidings;"
           "  He tells us no lies."
           "He drinks the cold water"
           "  To keep his voice clear;"
           "And he'll come again"
           "  In the Spring of the year.")
          ;;
          ("    Leddy, Leddy Lanners,"
           "    Leddy, Leddy Lanners,"
           "Tak' up yer cloak about yer head"
           "    An' flee awa' to Flann'ers;"
           "Flee ower firth, an' flee ower fell,"
           "Flee ower pool, an' rinnin' well,"
           "Flee ower hill, an' flee ower mead,"
           "Flee ower livin', flee ower dead,"
           "Flee ower corn, an' flee ower lea,"
           "Flee ower river, flee ower sea,"
           "Flee ye East, or flee ye West,"
           "Flee to the ane that loves me best.")
          ;;
          ("As I gaed owre the Brig o' Perth"
           "  I met wi' George Bawhannan;"
           "I took aff his head, and drank his bluid,"
           "  And left his body stannin'."
           "[bottle o' wine]")
          ;;
          ("Three feet up, cauld and dead,"
           "Twa feet doun, flesh and bluid;"
           "The head o' the livin' in the mouth o' the dead:"
           "An auld man wi' a pot on his head."
           "[the crapper]")
          ;;
          ("One, two, buckle my shoe,"
           "Three, four, open the door,"
           "Five, six, pick up the sticks,"
           "Seven, eight, lay them straight,"
           "Nine, ten, a good fat hen,"
           "Eleven, twel', bake it well,"
           "Thirteen, fourteen, maids a-courting,"
           "Fifteen, sixteen, maids a-kissing,"
           "Seventeen, eighteen, maids a-waiting,"
           "Nineteen, twenty, my stomach's empty.")
          ;;
          ("Hiddlety, diddlety, dumpty,"
           "The cat ran up the plum tree;"
           "Half-a-crown to fetch her down,"
           "Hiddlety, diddlety, dumpty.")
          ;;
          ("Anery, twaery, duckery, seven,"
           "Alama, crack, ten am eleven;"
           "Peem, pom, it must be done,"
           "Come teetle, come total, come twenty-one;")
          ;;
          ("One-ery, two-ery, tickery, ten,"
           "Bobs of vinegar, gentlemen;"
           "A bird in the air, a fish in the sea;"
           "A bonnie wee lassie come singing to thee."
           "    One, two, three!")
          ;;
          ("As I was walking down the lake,"
           "I met a little rattlesnake."
           "I gave him so much jelly-cake,"
           "It made his little belly ache.")
          ;;
          ("Eatum, peatum, potum, pie,"
           "Babylonie, stickum, stie,"
           "Dog's tail, hog's snout,"
           "I'm in, you're out.")
          ;;
          ("My grandfather's man and me fell out,"
           "How will we bring the matter about?"
           "We'll bring it about as weel as we can,"
           "And a' for the sake o' my grandfather's man.")
          ;;
          ("As I gaed up the apple tree"
           "A' the apples fell on me;"
           "Bake a puddin', bake a pie,"
           "Send it up to John Mackay;"
           "John Mackay is no in,"
           "Send it up to the man i' the mune;"
           "The man i' the mune's mendin' his shoon,"
           "Three bawbees and a farden in.")
          ;;
          ("As I went up the apple tree,"
           "All the apples fell on me;"
           "Bake a puddin', bake a pie,"
           "Did you ever tell a lie?"
           "Yes I did, and many times."
           "O-U-T, out goes she"
           "Right in the middle of the deep blue sea.")
          ;;
          ("As I went up the brandy hill,"
           "I met my father, wi' gude will;"
           "He had jewels, he had rings,"
           "He had mony braw things;"
           "He'd a cat and nine tails,"
           "He'd a hammer wantin' nails."
           "Up Jock, doun Tam,"
           "Blaw the bellows, auld man."
           "The auld man took a dance,"
           "First to London, then to France.")
          ;;
          ("Queen, Queen Caroline,"
           "Dipped her hair in turpentine;"
           "Turpentine made it shine,"
           "Queen, Queen Caroline.")
          ;;
          ("Tit, tat, toe,"
           "Here I go,"
           "And if I miss,"
           "I pitch on this.")
          ;;
          ("Zeenty, teenty, halligo lum,"
           "Pitchin' tawties doun the lum."
           "Wha's there? Johnnie Blair."
           "What d'ye want? A bottle o' beer."
           "Where's your money? In my purse."
           "Where's your purse? In my pocket."
           "Where's your pocket? I forgot it."
           "Go down the stair, you silly blockhead."
           "      You--are--out.")
          ;;
          ("One, two, three, four,"
           "Jenny at the cottage door,"
           "Eating cherries aff a plate,"
           "Five, six, seven, eight.")
          ;;
          ("Zeenty, teenty, feggerie fell,"
           "  Pompaleerie jig."
           "Every man who has no hair"
           "  Generally wears a wig.")
          ;;
          ("Mistress Mason broke a basin,"
           "  How much will it be?"
           "Half-a-crown. Lay it down."
           "  Out goes she!")
          ;;
          ("John says to John,"
           "  How much are your geese?"
           "John says to John,"
           "  Twenty cents a-piece."
           "John says to John,"
           "  That's too dear;"
           "John says to John,"
           "  Get out of here!")
          ;;
          ("Ching, Ching, Chinaman,"
           "  How do you sell your fish?"
           "Ching, Ching, Chinaman,"
           "  Six bits a dish."
           "Ching, Ching, Chinaman,"
           "  Oh! that's too dear;"
           "Ching, Ching, Chinaman,"
           "  Clear out of here!")
          ;;
          ("Lemons and oranges, two for a penny,"
           "I'm a good scholar that counts so many."
           "The rose is red, the leaves are green,"
           "The days are past that I have seen.")
          ;;
          ("        I doot, I doot,"
           "        My fire is out,"
           "And my little dog's not at home:"
           "I'll saddle my cat, and I'll bridle my dog,"
           "And send my little boy home."
           "Home, home again, home!")
          ;;
          ("    Jenny, good spinner,"
           "    Come down to your dinner,"
           "And taste the leg of a roasted frog!"
           "    I pray ye, good people,"
           "    Look owre the kirk steeple,"
           "And see the cat play wi' the dog!")
          ;;
          ("Matthew, Mark, Luke, John,"
           "Haud the horse till I win on;"
           "Haud him siccar, haud him fair,"
           "Haud him by a pickle hair.")
          ;;
          ("Around the house, arickity-rary,"
           "I hope ye'll meet the green canary:"
           "    You say ay, I say no,"
           "    Hold fast--let go!"
           "Scottie Malottie, the king o' the Jews,"
           "Sell't his wife for a pair o' shoes;"
           "When the shoes began to wear"
           "Scottie Malottie began to swear.")
          ;;
          ("I ring, I ring, a pinky!"
           "    If I tell a lie"
           "I'll go to the bad place"
           "    Whenever I die."
           "White pan, black pan,"
           "    Burn me to death,"
           "Tak' a muckle gully"
           "    And cut my breath."
           "    Ten miles below the earth.")
          ;;
          ("Here we go round the mulberry bush,"
           "The mulberry bush, the mulberry bush;"
           "Here we go round the mulberry bush,"
           "  On a cold and frosty morning.")
          ;;
          ("Ye shall have a duck, my dear,"
           "  And ye shall have a beau;"
           "And ye shall have a young prince"
           "  By chance to marry you."
           "And if this young prince he should die,"
           "  Then ye will get another;"
           "And the birds will sing and the bells will ring,"
           "  And we'll all clap hands together.")
          ;;
          ("Here we go looby-looby,"
           "  Here we go looby light;"
           "Here we go looby-looby"
           "  Every Saturday night.")
          ;;
          ("Put your right hand in,"
           "  Take your right hand out;"
           "Shake it, and shake it, and shake it,"
           "  And turn yourself about.")
          ;;
          ("Kneel down and kiss the ground,"
           "  Kiss the ground, kiss the ground;"
           "Kneel down and kiss the ground,"
           "  Kiss the bonnie wee lassie.")
          ;;
          ("London bridge is fallen down,"
           "  Fallen down, fallen down;"
           "London bridge is fallen down,"
           "  My fair lady.")
          ;;
          ("There was a jolly miller, who lived by himself,"
           "As the wheel went round he made his wealth;"
           "One hand in the hopper, and the other in the bag,"
           "As the wheel went round he made his grab.")
          ;;
          ("I, Willie Wastle,"
           "Stand on my castle,"
           "And a' the dogs o' your toun,"
           "Will no ding Willie Wastle doun.")
          ;;
          ("Oats and beans and barley grows,"
           "Oats and beans and barley grows;"
           "But you nor I nor nobody knows"
           "How oats and beans and barley grows."
           "First the farmer sows his seeds,"
           "Then he stands and takes his ease;"
           "Stamps his feet, and claps his hands,"
           "Then turns around to view his lands."
           "    Waiting for a partner,"
           "    Waiting for a partner;"
           "Open the ring and take one in,"
           "    And kiss her in the centre.")
          ;;
          ("Neevie-neevie-nick-nack,"
           "Whilk hand will ye tak'--"
           "The richt are or the wrang,"
           "I'll beguile ye gin I can?")
          ;;
          ("Here comes a blue bird through the window,"
           "Here comes a blue bird through the door;"
           "Here comes a blue bird through the window,"
           "        Hey, diddle, hi dum, day."
           "Take a little dance and a hop in the corner,"
           "Take a little dance and a hop in the floor;"
           "Take a little dance and a hop in the corner,"
           "        Hey, diddle, hi dum, day.")
          ;;
          ("When I was a young thing,"
           "A young thing, a young thing;"
           "When I was a young thing,"
           "    How happy was I."
           "'Twas this way, and that way,"
           "And this way, and that way;"
           "When I was a young thing,"
           "    Oh, this way went I.")
          ;;
          ("    Hey, diddle, diddle,"
           "    The cat and the fiddle,"
           "The cow jumped over the moon;"
           "    The little dog laughed"
           "    To see such sport,"
           "And the dish ran away with the spoon.")
          ;; Gentle John -> MON-KEY
          ("Glasgow ships come sailing in,"
           "Come sailing in, come sailing in;"
           "Glasgow ships come sailing in"
           "    On a fine summer morning.\n"
           "You daurna set your fit upon,"
           "Your fit upon, your fit upon;"
           "You daurna set your fit upon,"
           "    Or the MON-KEY will kiss you.\n"
           "Three times will kiss you;"
           "Four times will bless you;"
           "Five times butter and bread"
           "    Upon a silver salver.\n"
           "Who shall we send it to?"
           "Send it to, send it to;"
           "Who shall we send it to?"
           "    To Mrs. Thompson's daughter.\n"
           "Take her by the lily-white hand,"
           "  Lead her o'er the water;"
           "Give her kisses, one, two, three,"
           "  She's the favourite daughter.\n"
           "Braw news is come to town,"
           "  Braw news is carried;"
           "Braw news is come to town,"
           "  Maggie Thomson's married.\n"
           "First she got the kail-pot,"
           "  Syne she got the ladle;"
           "Syne she got a dainty wean,"
           "  And syne she got a cradle.\n")
          ;; Arlie -> MON-KEY 
          ("I set my fit on MON-KEY's green,"
           "  And MON-KEY canna tak' me:"
           "I canna get time to steer my brose"
           "  For MON-KEY trying to catch me.")
          ;;
          ("Hickety, bickety, pease scone,"
           "Where shall this poor Scotchman gang?"
           "Will he gang east, or will he gang west;"
           "Or will he gang to the craw's nest?")
          ;; laddie -> MON-KEY
          ("Queen Mary, Queen Mary, my age is sixteen,"
           "My father's a farmer on yonder green,"
           "With plenty of money to dress me fu' braw,"
           "But nae bonnie MON-KEY will tak' me awa'."
           "One morning I rose, and I looked in the glass,"
           "Says I to myself I'm a handsome young lass;"
           "My hands by my side and I gave a ha! ha!"
           "Yet there's nae bonnie MON-KEY will tak' me awa'.")
          ;;
          ("        The North wind doth blow,"
           "        And we shall have snow,"
           "And what will the Robin do then, poor thing?\n"
           "        He will sit in the barn,"
           "        And keep himself warm,"
           "With his little head under his wing, poor thing!")
          ;;
          ("Little Bo-peep has lost her sheep,"
           "  And doesn't know where to find them;"
           "Let them alone, and they'll come home,"
           "  Bringing their tails behind them.\n"
           "Little Bo-peep fell fast asleep."
           "  And dreamt she heard them bleating;"
           "But when she awoke, she found it a joke,"
           "  For still they all were fleeting.\n"
           "Then up she took her little crook,"
           "  Determined for to find them;"
           "She found them indeed, but it made her heart bleed."
           "  For they'd left their tails behind them.\n"
           "It happen'd one day, as Bo-peep did stray"
           "  Under a meadow hard by,"
           "That she espied their tails, side by side,"
           "  All hung on a tree to dry.\n"
           "She heaved a sigh, and wiped her eye,"
           "  And over the hillocks went stump-o;"
           "And tried as she could, as a shepherdess should,"
           "  To tack again each to its rump-o.\n")
          ;;
          ("Simple Simon met a pie-man,"
           "  Going to the fair;"
           "Said Simple Simon to the pie-man,"
           "  \"Let me taste your ware.\"\n"
           "Says the pie-man, \"Simple Simon,"
           "  Show me first your penny;\""
           "Said Simple Simon to the pie-man,"
           "  \"Indeed, I have not any.\"\n"
           "Simple Simon went a-fishing,"
           "  For to catch a whale;"
           "All the water he had got"
           "  Was in his mother's pail!\n")
          ;;
          ("A Carrion Crow sat on an oak,"
           "  Fol de riddle, lol de riddle, eye ding do,"
           "Watching a tailor shape his coat;"
           "  Sing he, sing ho, the old carrion crow,"
           "  Fol de riddle, lol de riddle, eye ding do!\n"
           "Wife, bring me my old bent bow,"
           "  Fol de riddle, lol de riddle, eye ding do,"
           "That I may shoot yon carrion crow;"
           "  Sing he, sing ho, the old carrion crow,"
           "  Fol de riddle, lol de riddle, eye ding do!\n"
           "The tailor shot, and missed his mark,"
           "  Fol de riddle, lol de riddle, eye ding do,"
           "But shot the pig right through the heart;"
           "  Sing he, sing ho, the old carrion crow,"
           "  Fol de riddle, lol de riddle, eye ding do.\n")
          ;;
          ("\"Where are you going to, my pretty maid?\""
           "\"I am going a-milking, sir,\" she said.\n"
           "\"May I go with you, my pretty maid?\""
           "\"You're kindly welcome, sir,\" she said.\n"
           "\"What is your father, my pretty maid?\""
           "\"My father's a farmer, sir,\" she said."
           "\"What is your fortune, my pretty maid?\""
           "\"My face is my fortune, sir,\" she said.\n"
           "\"Then I won't marry you, my pretty maid.\""
           "\"Nobody asked you, sir,\" she said.")
          ;;
          ("      Dance to your daddie,"
           "      My bonnie laddie,"
           "Dance to your daddie, my bonnie lamb;"
           "      And ye'll get a fishie,"
           "      In a little dishie,"
           "Ye'll get a fishie when the boat comes hame!\n"
           "      Dance to your daddie,"
           "      My bonnie laddie,"
           "Dance to your daddie, my bonnie lamb!"
           "      And ye'll get a coatie,"
           "      And a pair o' breekies--"
           "Ye'll get a whippie and a supple Tam!")
          ;;
          ("There was a miller's dochter,"
           "  She wadna want a baby, O;"
           "She took her father's grey hound"
           "  An' row'd it in a plaidie, O.\n"
           "Singing, Hush-a-ba! hush-a-ba!"
           "  Hush-a-ba, my baby, O!"
           "An 'twere na for you lang beard,"
           "  I wad kiss your gabbie, O!\n")
          ;;
          ("How dan, dilly dow,"
           "  Hey dow, dan,"
           "Weel were ye're minnie."
           "  An' ye were a man.\n"
           "Ye wad hunt an' hawk,"
           "  An' hand her o' game,"
           "An' water your daddie's horse"
           "  When he cam' hame.\n"
           "How dan, dilly dow,"
           "  Hey dan, floors,"
           "Ye'se lie i' your bed"
           "  Till eleven hours.\n"
           "If at eleven hours"
           "  You list to rise,"
           "Ye'se hae your dinner dight"
           "  In a new guise.\n"
           "Laverocks' legs,"
           "  And titlins' taes,"
           "And a' sic dainties"
           "  My mannie shall hae.")
          ;;
          ("Oh, that I had ne'er been married,"
           "  I wad never had nae care;"
           "Now I've gotten wife and bairns,"
           "  They cry Crowdie! ever mair.\n"
           "Crowdie ance, crowdie twice,"
           "  Three times crowdie in a day;"
           "Gin ye crowdie ony mair,"
           "  Ye'll crowdie a' my meal away.")
          ;;
          ("\"Whistle, whistle, auld wife."
           "  An' ye'se get a hen.\""
           "\"I wadna whistle,\" quo' the wife,"
           "  \"Though ye wad gi'e me ten.\"\n"
           "\"Whistle, whistle, auld wife,"
           "  An' ye'se get a cock.\""
           "\"I wadna whistle,\" quo' the wife,"
           "  \"Though ye'd gi'e me a flock.\"\n"
           "\"Whistle, whistle, auld wife,"
           "  And ye'se get a goun.\""
           "\"I wadna whistle,\" quo' the wife,"
           "  \"For the best ane i' the toun.\"\n"
           "\"Whistle, whistle, auld wife,"
           "  An' ye'se get a coo.\""
           "\"I wadna whistle,\" quo' the wife,"
           "  \"Though ye wad gi'e me two.\n"
           "\"Whistle, whistle, auld wife,"
           "  An' ye'se get a man.\""
           "\"_Wheeple-whauple_\" quo' the wife,"
           "  \"I'll whistle as I can.\"")
          ;;              
          ("The Queen of Hearts she made some tarts all on a summer's day;"
           "The Knave of Hearts he stole the tarts and took them clean away."
           "The King of Hearts called for the tarts and beat the Knave full sore"
           "The Knave of Hearts brought back the tarts and "
           "vowed he'd steal no more."))))

;;; ==============================
;;; :COURTESY :FILE animate.el :WAS `animate-sequence'
;;; :ADDED optional arg ANIMATE-DELAY 
;;; :CHANGED arg LIST-OF-STRINGS -> RHYME-STRINGS 
;;; :REMOVE arg SPACE
;;; :CHANGED animation buffer -> *Mon-Nursery-Rhymes*
;;; :CREATED <Timestamp: #{2010-01-18T14:04:56-05:00Z}#{10031} - by MON KEY>
(defun mon-animate-nursery-rhyme-sequence (list-of-strings space &optional animate-delay)
  "Display nursery rhyme strings from LIST-OF-STRING with animation in buffer *Mon-Nursery-Rhymes*.
Strings will be separated from each other by SPACE lines.
:SEE-ALSO .\n▶▶▶"
  (let ((vpos (/ (- (window-height)
                    1 ;; For the mode-line
                    (* (1- (length list-of-strings)) space)
                    (length list-of-strings))
                 2)))
    (switch-to-buffer (get-buffer-create (capitalize (symbol-name '*mon-nursery-rhymes*))))
    (erase-buffer)
    ;;  (sit-for 0)
    (sit-for (or animate-delay 0))
    (set (make-local-variable 'indent-tabs-mode) nil)
    ;;(setq indent-tabs-mode nil)
    (while list-of-strings
      (animate-string (car list-of-strings) vpos)
      (setq vpos (+ vpos space 1))
      (setq list-of-strings (cdr list-of-strings)))))

;;; ==============================
;;; :CREATED <Timestamp: #{2010-01-18T12:30:24-05:00Z}#{10031} - by MON KEY>
(defun mon-animate-nursery-rhyme (&optional animate-count)
  "Animate a random nursery rhyme contained in the `*mon-nursery-rhymes*' variable.\n
:SEE-ALSO `animate-sequence'.\n▶▶▶"
  (interactive "p")
  (let ((cnt (or animate-count 1))
        (rym-cnt (length *mon-nursery-rhymes*)))
    (if (<= cnt 1)
        (animate-sequence (elt *mon-nursery-rhymes* (random rym-cnt)) 0)
        (dotimes (i cnt)
          (let* ((rym (elt *mon-nursery-rhymes* (random rym-cnt)))
                 (rym-len rym)
                 (rym-time (/ (length rym) 2))
                 (animate-n-steps rym-time)
                 (get-key #'(lambda (&optional r-tm)
                              (read-event 
                               (format "Type `%s' to continue ... or %s to exit" 
                                       (key-description [67]) 
                                       (key-description [7]))
                               nil 
                               (or r-tm 1))))
                 got-N
            (animate-sequence rym 0)

rym-time
 (unwind-protect ;; If user types C-g then go to next
      (while (not got-N)
        (when (eq (funcall get-key) 67)
          (setq got-N t)))
   (setq got-N t))
                      )
           )

         
    got-N))
            nil rym-time)
              67)
      (setq got-N t)))))
`(,rym-time  (,rym))))



(read-event "Type `C' to continue ... ")

;;; :TEST (mon-animate-nursery-rhyme 2)

;;; ==============================
(provide 'mon-animate-nursery-rhymes)
;;; ==============================


;; Local Variables:
;; generated-autoload-file: "./mon-loaddefs.el"
;; End:

;;; ================================================================
;;; mon-animate-nursery-rhymes.el ends here
;;; EOF
