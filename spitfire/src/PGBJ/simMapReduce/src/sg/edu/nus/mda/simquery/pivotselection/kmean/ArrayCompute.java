package sg.edu.nus.mda.simquery.pivotselection.kmean;
/**
 * ���������
 *
 * <p>time:2011-5-27</p>
 * @author T. QIN
 */
public class ArrayCompute
{
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

    /**
     * �������
     *
     * @param x1
     * @param x2
     * @return
     * @see: 
     */
    public static double[] minus(final double[] x1, final double[] x2)
    {
        if (x1.length != x2.length)
        {
            System.err.print("�������Ȳ��Ȳ��������");
            System.exit(0);
        }
        double[] result = new double[x1.length];
        for (int i = 0; i < result.length; i++)
        {
            result[i] = x1[i] - x2[i];
        }
        return result;
    }

    /**
     * �������һ������
     *
     * @param x1
     * @param c
     * @return
     * @see: 
     */
    public static double[] multiplyC(final double[] x1, final double c)
    {
        double[] ret = new double[x1.length];
        for (int i = 0; i < x1.length; i++)
        {
            ret[i] = x1[i] * c;
        }
        return ret;
    }

    /**
     * �������һ������
     *
     * @param x1
     * @param c
     * @return
     * @see: 
     */
    public static double[] devideC(final double[] x1, final double c)
    {
        double[] ret = new double[x1.length];
        for (int i = 0; i < x1.length; i++)
        {
            ret[i] = x1[i] / c;
        }
        return ret;
    }
}