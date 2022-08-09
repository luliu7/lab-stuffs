#Writes a program that will run python to do bedtools on each and every last one of these line thingies

import pybedtools
#import sys

#Expects 3 inputs in the format of [a], [b], [list of all tsets to run]
#comparer = sys.argv[1]  #The thing to be compared to (a)
#limiter = sys.argv[2] #The thing to compare (b)
#lisofstufftorun = sys.argv[3] #List of all the tsets to run

lisofstufftorun = ["male_reproductive", "glia.mapping1", "gonad", "ectoderm.mapping1", "mapping1.blastoderm" ,"emb-larv_foregut" , "mapping1.glia"]
#lisofstufftorun = ["male_reproductive"]

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

#Creates neg/original redfly (to run once)
limiterneg = "/panasas/scratch/grp-mshalfon/Luna/scripts/PostScrmshawStuffs/pCRMevalstuffs/parallelrun/tmp/tmp2/allredfly2020_2kb.txt"
bneg = pybedtools.BedTool(limiterneg)
bneg.saveas("/panasas/scratch/grp-mshalfon/Luna/scripts/PostScrmshawStuffs/pCRMevalstuffs/parallelrun/tmp/tmp2/COPY_allredfly2020_2kb.txt")
bnegsorted = bneg.sort()

limiterorig = "/panasas/scratch/grp-mshalfon/Luna/origdataScrmshaw/forPostProcessOrig/orig_pCRMeval/placetorunpCRMeval/tmp/tmp2/allredfly2020_2kb.txt"
borig = pybedtools.BedTool(limiterorig)
borig.saveas("/panasas/scratch/grp-mshalfon/Luna/origdataScrmshaw/forPostProcessOrig/orig_pCRMeval/placetorunpCRMeval/tmp/tmp2/COPY_allredfly2020_2kb.txt")
borigsorted = borig.sort()


#initiates looping variables
typesss = ["scripts/PostScrmshawStuffs/pCRMevalstuffs/parallelrun/tmp", "origdataScrmshaw/forPostProcessOrig/orig_pCRMeval/placetorunpCRMeval/tmp"] #neg path vs orig path
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

            if z == "scripts/PostScrmshawStuffs/pCRMevalstuffs/parallelrun/tmp": #Negative
                bsorted = bnegsorted
                thingy = "neg"
            else:
                bsorted = borigsorted
                thingy = "orig"


            #makes a copy and sorts
            comparer = "/panasas/scratch/grp-mshalfon/Luna/" + z + "/FlippedIntersectedNotIntact_Scrms_and_modified_redfly_" + x + "_" + y + ".bed"
            a = pybedtools.BedTool(comparer)
            a.saveas("/panasas/scratch/grp-mshalfon/Luna/" + z + "/FlippedIntersectedNotIntact_Scrms_and_modified_redfly_" + x + "_" + y + "_COPY.bed")
            asorted = a.sort()
            asorted.saveas("/panasas/scratch/grp-mshalfon/Luna/" + z + "/FlippedIntersectedNotIntact_Scrms_and_modified_redfly_" + x + "_" + y + "_sorted.bed")


            combined = asorted.intersect(bsorted, sorted = True, u = True, wa = True, r = True, f = 0.5)
            combined.saveas("/panasas/scratch/grp-mshalfon/Luna/finalanalysis/rawfiles/" + thingy + "-" + y + "-" + x + "-intersect.bed")



        #after neg and orig files are created, intersect together

        #First is neg as base, overlap with orig (so neg = a, orig = b)
        athingy = pybedtools.BedTool("/panasas/scratch/grp-mshalfon/Luna/finalanalysis/rawfiles/neg-" + y + "-" + x + "-intersect.bed")
        bthingy = pybedtools.BedTool("/panasas/scratch/grp-mshalfon/Luna/finalanalysis/rawfiles/orig-" + y + "-" + x + "-intersect.bed")
        a_with_b = athingy.intersect(bthingy, sorted = True, u = True, wa = True, r = True, f = 0.5)
        abfilename = "/panasas/scratch/grp-mshalfon/Luna/finalanalysis/intersectedfiles/neg_with_orig-" + y + "-" + x + ".bed"
        a_with_b.saveas(abfilename)

        #Gets total line count:
        abcount = countlines(abfilename)
        ablin = x + "\t" + y + "\tneg_with_orig\t" + str(abcount) + "\n"
        appe.write(ablin)


        #Then it's orig as base, overlap with neg *orgi = a, neg = b)
        athin = pybedtools.BedTool("/panasas/scratch/grp-mshalfon/Luna/finalanalysis/rawfiles/neg-" + y + "-" + x + "-intersect.bed")
        bthin = pybedtools.BedTool("/panasas/scratch/grp-mshalfon/Luna/finalanalysis/rawfiles/orig-" + y + "-" + x + "-intersect.bed")
        b_with_a = bthin.intersect(athin, sorted = True, u = True, wa = True, r = True, f = 0.5)
        bafilename = "/panasas/scratch/grp-mshalfon/Luna/finalanalysis/intersectedfiles/orig_with_neg-" + y + "-" + x + ".bed"
        b_with_a.saveas(bafilename)

        #Gets total line count:
        bacount = countlines(bafilename)
        balin = x + "\t" + y + "\torig_with_neg\t" + str(bacount) + "\n"
        appe.write(balin)

        print("Method " + y + " is done")





appe.close()
print("Done!")
