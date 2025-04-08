import numpy as np
import pandas as pd
import yaml

alpha_s = 0.118
mw = 80.387
mz = 91.1876
sw = np.sqrt(1 - mw**2 / mz**2)
cw = np.sqrt(1 - sw**2)


def evolve_gs(scale):
    alpha_s = 0.118
    gs = np.sqrt(4 * np.pi * alpha_s)
    # evolve gs from MZ to scale
    beta0 = 11 - 2 / 3 * 6
    return gs / np.sqrt(
        1 + 2 * beta0 * gs**2 / (4 * np.pi) ** 2 * np.log(scale / 91.1876)
    )


# run gs to the matching scale
matching_scale = 500
gs = evolve_gs(matching_scale)

# if a tuple, it's a direct match
# if a list, it's a linear combination of the Warsaw coefficients, first list
# is the list of Wilson coefficients, second list is the list of factors to multiply
to_smefit_dict = {
    "Ote":     {("ceu",  "(1 1 3 3)") : 1.0},
    "Opd":     {("cHBox","()") : 1.0}, # Should it be -1.0? (SMEFIT does dmu(H^2) * dm (H^2), while in the Warsaw basis we have H^2 dmu^2 H^2)
    "Opdi":    {("cHd",  "(1 1)") : 1.0}, # What about the (2 2) and (3 3) entries?
    "OpD":     {("cHD",  "()") : 1.0},
    "Ope":     {("cHe",  "(1 1)") : 1.0},
    "Opmu":    {("cHe",  "(2 2)") : 1.0},
    "Opta":    {("cHe",  "(3 3)") : 1.0},
    "Opl1":    {("cHl1", "(1 1)") : 1.0},
    "Opl2":    {("cHl1", "(2 2)") : 1.0},
    "Opl3":    {("cHl1", "(3 3)") : 1.0},
    "OpqMi":   {("cHq1", "(1 1)") : 1.0, ("cHq3", "(1 1)") : -1.0},
    "OpQM":    {("cHq1", "(3 3)") : 1.0, ("cHq3", "(3 3)") : -1.0},
    "O3pQ":    {("cHq3", "(3 3)") : 1.0},
    "Opu":     {("cHu",  "(1 1)") : 1.0}, # What about the (2 2) entry?
    "Opt":     {("cHu",  "(3 3)") : 1.0},
    "Oll1111": {("cll",  "(1 1 1 1)") : 1.0},
    "Oll":     {("cll",  "(1 2 2 1)") : 1.0},
    "OQlM1":   {("clq1", "(1 1 3 3)") : 1.0, ("clq3", "(1 1 3 3)") : -1.0},
    "Otl1":    {("clu",  "(1 1 3 3)") : 1.0},
    "O1qd":    {("cqd1", "(3 3 1 1)") : 1.0},
    "O8qd":    {("cqd8", "(3 3 1 1)") : 1.0},
    "OQe":     {("cqe",  "(3 3 1 1)") : 1.0},
    "O81qq":   {("cqq1", "(1 3 3 1)") : 1.0, ("cqq3", "(1 3 3 1)") : 3.0},
    "O11qq":   {("cqq1", "(1 1 3 3)") : 1.0, ("cqq1", "(1 3 3 1)") : 1.0/6.0, ("cqq3", "(1 3 3 1)") : 1.0/2.0},
    "O83qq":   {("cqq1", "(1 3 3 1)") : 1.0, ("cqq3", "(1 3 3 1)") : -1.0},
    "O13qq":   {("cqq3", "(1 1 3 3)") : 1.0, ("cqq1", "(1 3 3 1)") : 1.0/6.0, ("cqq3", "(1 3 3 1)") : -1.0/6.0},
    "O8qt":    {("cqu8", "(1 1 3 3)") : 1.0}, # What about the (2 2 3 3) entry?
    "O1qt":    {("cqu1", "(1 1 3 3)") : 1.0},
    "O8ut":    {("cuu",  "(1 3 3 1)") : 2.0},
    "O1ut":    {("cuu",  "(1 1 3 3)") : 1.0, ("cuu", "(1 3 3 1)") : 1.0/3.0},
    "O8qu":    {("cqu8", "(3 3 1 1)") : 1.0},
    "O1qu":    {("cqu1", "(3 3 1 1)") : 1.0},
    "O8dt":    {("cud8", "(3 3 1 1)") : 1.0},
    "O1dt":    {("cud1", "(3 3 1 1)") : 1.0},
    "O8qd":    {("cqd8", "(3 3 1 1)") : 1.0},
    "O1qd":    {("cqd1", "(3 3 1 1)") : 1.0},
    "OQQ1":    {("cqq1", "(3 3 3 3)") : 2.0, ("cqq3", "(3 3 3 3)") : -2.0/3.0},
    "OQQ8":    {("cqq3", "(3 3 3 3)") : 8.0},
    "OQt1":    {("cqu1", "(3 3 3 3)") : 1.0},
    "OQt8":    {("cqu8", "(3 3 3 3)") : 1.0},
    "Ott1":    {("cuu",  "(3 3 3 3)") : 1.0},
    "OtZ":     {("cuB",  "(3 3)") : -sw, ("cuW", "(3 3)") : cw},
    "OtG":     {("cuG",  "(3 3)") : 1.0/gs},
    "Otp":     {("cuH",  "(3 3)") : 1.0},
}

warsaw_coeffs = []
for coeffDict in to_smefit_dict.values():
    warsaw_coeffs += list(coeffDict.keys())
warsaw_coeffs = list(set(warsaw_coeffs)) # Make sure to keep unique coeffs

file = "coeff_values_mST_500_mChi_400.csv"
# Read the CSV file
# skip rows starting with #
df = pd.read_csv(file, comment="#")

print(f'\nLooking for {len(warsaw_coeffs)} out of {len(df)} coeffs in {file}\n')


# Store the values for the yDM^0, yDM^2 and yDM^4 terms separately
smefit_values = {coeff_smefit : np.array((0.,0.,0.)) for coeff_smefit in to_smefit_dict}

for coeff_smefit, coeff_dict in to_smefit_dict.items():
    for (coeff_warsaw,indices),factor in coeff_dict.items():
        # now we find the coeff and index in the dataframe, first and second columns
        row = df.query("`Coefficient` == @coeff_warsaw and `Indices` == @indices")
        # check if row is empty
        if row.empty:
            print(f"Coeff {coeff_warsaw} with index {indices} for {coeff_smefit} not found")
            continue
        C_array = np.array((
            float(row["C0 (1/GeV^2)"].values[0]),
            float(row["C2 (1/GeV^2)"].values[0]),
            float(row["C4 (1/GeV^2)"].values[0]),
        ))
        # smefit wants coefficients in TeV^-2, so we multiply by 1000^2
        smefit_values[coeff_smefit] += factor*1e6*C_array


# Convert the values to smefit card constraints
smefit_card_constraints = {}
for coeff_smefit,(C0,C2,C4) in smefit_values.items():
    # Round results to 4 significant digits
    smefit_card_constraints[coeff_smefit] = {
        "constrain": [
            {"yDM": [float(f'{C0:1.4e}'), 0]},
            {"yDM": [float(f'{C2:1.4e}'), 2]},
            {"yDM": [float(f'{C4:1.4e}'), 4]},
        ],
        "max": 10.0,
        "min": -10.0,
    }

smefit_card_constraints["yDM"] = {"max": 10.0, "min": -10.0}
output = {}
output["coefficients"] = smefit_card_constraints
# output the smefit_card_constraints dictionary to a yaml file
with open("UV_model_constraints.yaml", "w") as f:
    yaml.dump(output, f, default_flow_style=False)
