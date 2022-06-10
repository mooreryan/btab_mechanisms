Hello world

  $ bm pick in_btab.tsv out_btab.tsv ids.txt
  LOG -- Reading IDs
  LOG -- Processing btab
  $ sort out_btab.tsv
  q1	t1	0.1	1	1	1	1	1	1	1	0.1	1.
  q1	t2	0.1	1	1	1	1	1	1	1	0.1	1.
  q2	t1	0.1	1	1	1	1	1	1	1	0.1	1.
  q2	t2	0.1	1	1	1	1	1	1	1	0.1	1.

It works with btabs with qlen and tlen.

  $ bm pick in_btab_len.tsv out_btab.tsv ids.txt
  LOG -- Reading IDs
  LOG -- Processing btab
  $ sort out_btab.tsv
  q1	t1	0.1	1	1	1	1	1	1	1	0.1	1.	1	1
  q1	t2	0.1	1	1	1	1	1	1	1	0.1	1.	1	1
  q2	t1	0.1	1	1	1	1	1	1	1	0.1	1.	1	1
  q2	t2	0.1	1	1	1	1	1	1	1	0.1	1.	1	1
