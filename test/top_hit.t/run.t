Hello world

  $ bm top_hit in_btab.tsv out_btab.tsv --best-method=overall --compare-column=evalue
  $ sort out_btab.tsv
  q1	t1	0.1	1	1	1	1	1	1	1	0.001	10.
  q2	t1	0.1	1	1	1	1	1	1	1	0.001	10.

  $ bm top_hit in_btab.tsv out_btab.tsv --best-method=overall --compare-column=bits
  $ sort out_btab.tsv
  q1	t2	0.1	1	1	1	1	1	1	1	0.01	20.
  q2	t2	0.1	1	1	1	1	1	1	1	0.01	20.

  $ bm top_hit in_btab.tsv out_btab.tsv --best-method=overall --compare-column=pident
  $ sort out_btab.tsv
  q1	t3	0.2	1	1	1	1	1	1	1	0.01	10.
  q2	t3	0.2	1	1	1	1	1	1	1	0.01	10.

  $ bm top_hit in_btab.tsv out_btab.tsv --best-method=pair --compare-column=evalue
  $ sort out_btab.tsv
  q1	t1	0.1	1	1	1	1	1	1	1	0.001	10.
  q1	t2	0.1	1	1	1	1	1	1	1	0.01	20.
  q1	t3	0.2	1	1	1	1	1	1	1	0.01	10.
  q2	t1	0.1	1	1	1	1	1	1	1	0.001	10.
  q2	t2	0.1	1	1	1	1	1	1	1	0.01	20.
  q2	t3	0.2	1	1	1	1	1	1	1	0.01	10.

  $ bm top_hit in_btab.tsv out_btab.tsv --best-method=pair --compare-column=bits
  $ sort out_btab.tsv
  q1	t1	0.1	1	1	1	1	1	1	1	0.001	10.
  q1	t2	0.1	1	1	1	1	1	1	1	0.01	20.
  q1	t3	0.2	1	1	1	1	1	1	1	0.01	10.
  q2	t1	0.1	1	1	1	1	1	1	1	0.001	10.
  q2	t2	0.1	1	1	1	1	1	1	1	0.01	20.
  q2	t3	0.2	1	1	1	1	1	1	1	0.01	10.

  $ bm top_hit in_btab.tsv out_btab.tsv --best-method=pair --compare-column=pident
  $ sort out_btab.tsv
  q1	t1	0.1	1	1	1	1	1	1	1	0.001	10.
  q1	t2	0.1	1	1	1	1	1	1	1	0.01	20.
  q1	t3	0.2	1	1	1	1	1	1	1	0.01	10.
  q2	t1	0.1	1	1	1	1	1	1	1	0.001	10.
  q2	t2	0.1	1	1	1	1	1	1	1	0.01	20.
  q2	t3	0.2	1	1	1	1	1	1	1	0.01	10.