import("stdfaust.lib");

chamberlin(F, Q, x) = outs
with {
  f = 2.0*sin(ma.PI*F/ma.SR);
  q = 1.0/Q;

  lp(m1, m2) = m2+f*m1;
  hp(m1, m2) = x-m1*q-lp(m1, m2);
  bp(m1, m2) = m1+f*hp(m1, m2);
  np(m1, m2) = lp(m1, m2)+hp(m1, m2);

  outs = LP, HP, BP, BR letrec {
    'M1 = M1+f*hp(M1, M2);
    'M2 = M2+M1*f;
    'LP = lp(M1, M2);
    'HP = hp(M1, M2);
    'BP = bp(M1, M2);
    'BR = np(M1, M2);
  };
};
