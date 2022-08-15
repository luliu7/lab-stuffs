#Writes a program that will run python to do bedtools on each and every last one of these line thingies
#Now it intersects with each other only

import pybedtools
import re
#import sys

#Expects 3 inputs in the format of [a], [b], [list of all tsets to run]
#comparer = sys.argv[1]  #The thing to be compared to (a)
#limiter = sys.argv[2] #The thing to compare (b)
#lisofstufftorun = sys.argv[3] #List of all the tsets to run

#lisofstufftorun = ["male_reproductive", "glia.mapping1", "gonad", "ectoderm.mapping1", "mapping1.blastoderm" ,"emb-larv_foregut" , "mapping1.glia"]
#lisofstufftorun = ["male_reproductive"]
lisofstufftorun = ["adult_brain",
                   "adult_circulatory",
                   "adult_cns",
                   "adult_foregut",
                   "adult_mesoderm.mapping1",
                   "adult_midgut",
                   "adult_muscle",
                   "adult_nervous",
                   "adult_pns",
                   "adult_sense_organ",
                   "adult_somatic_muscle",
                   "amnioserosa.mapping1",
                   "antenna",
                   "antennal_disc",
                   "antennal_lobe",
                   "blastoderm.mapping1",
                   "cardiac.mapping1",
                   "disc.mapping1",
                   "disc.mapping2",
                   "dorsal_ectoderm.mapping1",
                   "ectoderm.mapping1",
                   "ectoderm.mapping2",
                   "emb-larv_circulatory_system",
                   "emb-larv_excretory",
                   "emb-larv_fat_body",
                   "emb-larv_foregut",
                   "emb-larv_hindgut",
                   "emb-larv_visceral",
                   "emb-larval_cns",
                   "emb-larval_mushroombody",
                   "emb-larval_neuron",
                   "emb-larval_opticlobe",
                   "embryonic_epidermis",
                   "embryonic_midgut",
                   "embryonic_muscle",
                   "embryonic_pns",
                   "embryonic_salivary",
                   "embryonic_sense_organ",
                   "embryonic_somatic_muscle",
                   "embryonic_trachea",
                   "embryonic_ventral_nervous_system",
                   "endoderm.mapping1",
                   "eye.mapping1",
                   "eye.mapping2",
                   "eye_disc",
                   "eye-antennal_disc",
                   "fat_body.mapping1",
                   "female_gonad.mapping1",
                   "female_reproductive",
                   "genital_disc",
                   "glia",
                   "glia.mapping1",
                   "glia.mapping2",
                   "gonad",
                   "haltere_disc",
                   "imaginal_disc",
                   "leg",
                   "leg_disc",
                   "male_gonad.mapping1",
                   "male_reproductive",
                   "malpig.mapping1",
                   "mapping1.amnioserosa",
                   "mapping1.blastoderm",
                   "mapping1.cns",
                   "mapping1.dorsal_ectoderm",
                   "mapping1.ectoderm",
                   "mapping1.endoderm",
                   "mapping1.eye",
                   "mapping1.female_gonad",
                   "mapping1.glia",
                   "mapping1.imaginal_disc",
                   "mapping1.male_gonad",
                   "mapping1.malpighian_tubules","mapping1.mesectoderm",
                   "mapping1.mesoderm",
                   "mapping1.neuroectoderm",
                   "mapping1.pns",
                   "mapping1.salivary_gland",
                   "mapping1.somatic_muscle",
                   "mapping1.tracheal_system",
                   "mapping1.ventral_ectoderm",
                   "mapping1.visceral_mesoderm",
                   "mapping2.amnioserosa",
                   "mapping2.blastoderm",
                   "mapping2.ectoderm",
                   "mapping2.endoderm",
                   "mapping2.eye",
                   "mapping2.glia",
                   "mapping2.imaginal_disc",
                   "mapping2.mesectoderm",
                   "mapping2.mesoderm",
                   "mapping2.neuroectoderm",
                   "mapping2.neuronal",
                   "mapping2.reproductive_system",
                   "mapping2.salivary_gland",
                   "mapping2.tracheal_system",
                   "mapping2.wing",
                   "mesectoderm.mapping1",
                   "mesoderm.mapping1",
                   "mesoderm.mapping2",
                   "myoblast",
                   "neuron",
                   "pns.mapping1",
                   "reproductive.mapping2",
                   "salivary.mapping1",
                   "somatic_muscle.mapping1",
                   "trachea.mapping1",
                   "ventral_ectoderm.mapping1",
                   "visceral.mapping1",
                   "wing.mapping2"]

writer = open("results.txt", 'w')
writer.write("Creates a file that will write lines (to fix header later)\n")
writer.close()

appe = open("results.txt", 'a')

#Helper functions
def countlines(filename):
    with open(filename, 'r') as fp:
        for count, line in enumerate(fp):
            pass

    fp.close()
    return count+1


#initiates looping variables
typesss = ["neg", "orig"] #neg path vs orig path
method = ["imm", "pac", "hexmcd"] #Which methods existe
thingy = ""

print("List of tsets to run:")
print(lisofstufftorun)
print("")
#Compares tset file to redfly, and then each other
for x in lisofstufftorun: #For each tset

    print("Now working on " + x)

    for y in method: #For each method

        for z in typesss: #For neg vs orig

            if z == "neg":
                res = "finalanalysis/negorigpureintersect/origsmallersetrun.bed"
            else:
                res = "finalanalysis/negorigpureintersect/negsmallersetrun.bed"


            comparer = "/panasas/scratch/grp-mshalfon/Luna/" + res

            reader = open(comparer, 'r')
            newwriter = open("/panasas/scratch/grp-mshalfon/Luna/finalanalysis/negorigpureintersect/rawsinglemethod/" + z + "-" + y + "-" + x + "-only.bed", "w")

            #grabs tset and method from orig file
            for ln in reader:
                lin = ln.strip().split('\t')
                if lin[15] != x:
                    pass
                else:
                    if lin[16] != y:
                        pass
                    else:
                        #print(lin)
                        newwriter.write(ln+'\n')

            reader.close()
            newwriter.close()


        thing11 = "/panasas/scratch/grp-mshalfon/Luna/finalanalysis/negorigpureintersect/rawsinglemethod/neg" + "-" + y + "-" + x + "-only.bed"
        thing12 = "/panasas/scratch/grp-mshalfon/Luna/finalanalysis/negorigpureintersect/rawsinglemethod/orig" + "-" + y + "-" + x + "-only.bed"

        athing1 = pybedtools.BedTool(thing11)
        bthing1 = pybedtools.BedTool(thing12)

        athinsort1 = athing1.sort()
        bthinsort1 = bthing1.sort()

        combined1 = athinsort1.intersect(bthinsort1, sorted = True, u = True, wa = True, r = True, f = 0.5)
        nosave = "/panasas/scratch/grp-mshalfon/Luna/finalanalysis/negorigpureintersect/rawsinglemethod/neg-orig-intersect-" + y + "-" + x + ".bed"
        combined1.saveas(nosave)

        nocount = countlines(nosave)
        nolin = x + "\t" + y + "\tneg_with_orig\t" + str(nocount) + "\n"
        appe.write(nolin)



# For orig overlap neg
        thing21 = "/panasas/scratch/grp-mshalfon/Luna/finalanalysis/negorigpureintersect/rawsinglemethod/orig" + "-" + y + "-" + x + "-only.bed"
        thing22 = "/panasas/scratch/grp-mshalfon/Luna/finalanalysis/negorigpureintersect/rawsinglemethod/neg" + "-" + y + "-" + x + "-only.bed"

        athing2 = pybedtools.BedTool(thing21)
        bthing2 = pybedtools.BedTool(thing22)

        athinsort2 = athing2.sort()
        bthinsort2 = bthing2.sort()

        combined2 = athinsort2.intersect(bthinsort2, sorted = True, u = True, wa = True, r = True, f = 0.5)
        onsave = "/panasas/scratch/grp-mshalfon/Luna/finalanalysis/negorigpureintersect/rawsinglemethod/orig-neg-intersect-" + y + "-" + x + ".bed"
        combined2.saveas(onsave)

        oncount = countlines(onsave)
        onlin = x + "\t" + y + "\torig_with_neg\t" + str(oncount) + "\n"
        appe.write(onlin)

        print("Method " + y + " is done")


appe.close()
print("Done!")
