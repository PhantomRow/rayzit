package sg.edu.nus.mda.simquery.pivotselection.kmean;
public class Utils
{

    /**
     * ����������֮���ŷ����¾���
     *
     * @param x1
     * @param x2
     * @return
     * @see: 
     */
    public static double distance(double[] x1, double[] x2)
    {
        double r = 0.0;
        for (int i = 0; i < x1.length; i++)
        {
            r += Math.pow(x1[i] - x2[i], 2);
        }
        return Math.sqrt(r);
    }

    /**
     * �������
     *
     * @param x1
     * @param x2
     * @return
     * @see: 
     */
    public static double[] add(final double[] x1, final double[] x2)
    {
        if (x1.length != x2.length)
        {
            System.err.print("�������Ȳ��Ȳ�����ӣ�");
            System.exit(0);
        }
        double[] result = new double[x1.length];
        for (int i = 0; i < result.length; i++)
        {
            result[i] = x1[i] + x2[i];
        }
        return result;
    }
}